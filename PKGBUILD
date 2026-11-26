# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=opendev-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Open-source coding agent for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/opendev-to/opendev"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/opendev-cli-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/opendev-cli-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('a64752cd4fa34265c2c777191ee7bec5f9e896d750ea95a3118b25dd332bf524')
sha256sums_aarch64=('1ebe17046805c3fc8d52258bce9fa5590b797ddd0480bef32c92c01ee8c07061')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="opendev-cli-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="opendev-cli-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/opendev" "${pkgdir}/usr/bin/opendev"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
