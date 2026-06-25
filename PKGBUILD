# Maintainer: Agustin Carrasco <asermax@gmail.com>

_pkgname=ghui
pkgname=ghui-bin
pkgver=0.8.0
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
sha256sums_x86_64=('107de479876504756c055ad4a593194b498d5be9d7287d902e28e88754e0a7fd')
sha256sums_aarch64=('29d45e5f4778d7fe2691108cc8602a112d02e5480c06ec9bfb387078984cd7a3')

latestver() {
  curl -s "https://api.github.com/repos/kitlangton/ghui/releases/latest" | \
    grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/' || true
}

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
