# Maintainer: Agustin Carrasco <asermax@gmail.com>

_pkgname=ghui
pkgname=ghui-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Terminal UI for GitHub pull requests"
arch=('x86_64' 'aarch64')
url="https://github.com/kitlangton/ghui"
license=('MIT')
depends=('glibc')
provides=('ghui')
conflicts=('ghui' 'ghui-git')
options=('!strip')
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz")
sha256sums=('4994c24b5bbb85529407e8cd0211efcf819236899d2c911cbdb18c00f231273a')
sha256sums_x86_64=('2fc08b71d91d9e7ae58d1966e6885f4a2a403a72f9319eb5d48a31152257059f')
sha256sums_aarch64=('21e7164f7182164f7c23dda2370d0727d0929ffecfb18c796f5b3ef72d04671a')

latestver() {
  curl -s "https://api.github.com/repos/kitlangton/ghui/releases/latest" | \
    grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/' || true
}

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
