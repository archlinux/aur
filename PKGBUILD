# Maintainer: Agustin Carrasco <asermax@gmail.com>

_pkgname=humanlayer
pkgname=humanlayer-bin
pkgver=0.31.48
pkgrel=1
pkgdesc="HumanLayer CLI - daemon management and authentication for HumanLayer coding sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/humanlayer/humanlayer"
license=('Apache-2.0')
depends=('glibc')
provides=('humanlayer')
conflicts=('humanlayer' 'humanlayer-git')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::https://registry.npmjs.org/@humanlayer/cli-linux-x64/-/cli-linux-x64-${pkgver}.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::https://registry.npmjs.org/@humanlayer/cli-linux-arm64/-/cli-linux-arm64-${pkgver}.tgz")
sha256sums_x86_64=('3e7c94ff608901e65b850cf9e3a33fc10408e3f7855705513a73009b529e8c88')
sha256sums_aarch64=('b4be667250a72935252fd327a3f1d3be1b355992147b49a18ec8faa96009178e')

latestver() {
  curl -s "https://registry.npmjs.org/@humanlayer/cli/latest" | \
    grep -o '"version":"[^"]*"' | sed -E 's/.*"([^"]+)"$/\1/' || true
}

package() {
  install -Dm755 "package/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Upstream only ships the license in the git repo, not in the npm tarballs,
  # so it's inlined here to avoid an extra pkgver-scoped source download per bump
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Apache Software License 2.0

Copyright (c) 2024, humanlayer Authors

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
EOF
}
