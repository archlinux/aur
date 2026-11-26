# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=herdr-nvim-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Neovim integration for the herdr workspace"
arch=('x86_64' 'aarch64')
url="https://github.com/ChmaraX/herdr-nvim"
license=('MIT')
depends=('glibc' 'libgcc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ChmaraX/herdr-nvim/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/herdr-nvim-app-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/herdr-nvim-app-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('536eeb3e3c1f269843db27bebd93b86fa8e3cd18c22616854ea0f31445734042')
sha256sums_x86_64=('561b97ab8299f9c27cc5e71445966075950d2327950208be5e659bf426aa10cf')
sha256sums_aarch64=('5b043b510c10d3f868885547e8a5bff6cea9e31694e0f3fdeef47b1e32cf5720')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="herdr-nvim-app-x86_64-unknown-linux-gnu/bin" ;;
    aarch64) _dir="herdr-nvim-app-aarch64-unknown-linux-gnu/bin" ;;
  esac
  install -Dm755 "${_dir}/herdr-nvim" "${pkgdir}/usr/bin/herdr-nvim"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
