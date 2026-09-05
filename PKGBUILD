# Maintainer: Agustin Carrasco <asermax@gmail.com>

_pkgname=humanlayer
pkgname=humanlayer-bin
pkgver=0.31.137
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
sha256sums_x86_64=('768a026f166c7a65bea97a8c6208ad9ca8d736d241955e49232758baf805013f')
sha256sums_aarch64=('5a92ddee33f383a4d72854e416f3dad41f5ce1f84b08eb04b6474b2b8a42832e')

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
