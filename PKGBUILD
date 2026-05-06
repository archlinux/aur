# Maintainer: Agustin Carrasco <asermax@gmail.com>

_pkgname=ghui
pkgname=ghui-bin
pkgver=0.7.0
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
sha256sums_x86_64=('c4a4129b55f36b567f86da16af64cb39410d6ef5c2b45372432fa0000cceb64e')
sha256sums_aarch64=('e9d693e953ee21d2e4db304daaf91c8e0689b8aa654e80a7691401cc92e5f9f3')

latestver() {
  curl -s "https://api.github.com/repos/kitlangton/ghui/releases/latest" | \
    grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/' || true
}

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
