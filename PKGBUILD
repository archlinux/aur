# Maintainer: Javad <ja7ad@live.com>
# This file is based released package by Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gofarsi-live-bin
_pkgver=2026.02.21-195914-56a599589
pkgver=2026.02.21_195914_56a599589
pkgrel=1
pkgdesc="Free Persian Go programming language book (Live version)"
arch=('x86_64' 'aarch64' 'i686' 'pentium4' 'armv6h')
url="https://github.com/GoFarsi/book"
license=('CC0-1.0')
depends=()
provides=('gofarsi' 'gofarsi-book')
conflicts=('gofarsi' 'gofarsi-book')

case "$CARCH" in
  x86_64) _deb="book_${_pkgver}_linux_amd64.deb" ;;
  aarch64) _deb="book_${_pkgver}_linux_arm64.deb" ;;
  i686|pentium4) _deb="book_${_pkgver}_linux_386.deb" ;;
  armv6h) _deb="book_${_pkgver}_linux_armv6.deb" ;;
  *) echo "Unsupported architecture: $CARCH"; exit 1 ;;
esac

source=("$_deb::https://github.com/GoFarsi/book/releases/download/v${_pkgver}/${_deb}")

sha256sums=('SKIP')

package() {
  bsdtar -xf "${srcdir}/${_deb}"
  bsdtar -xf data.tar.gz -C "${pkgdir}/"

  install -Dm755 "${pkgdir}/usr/local/bin/book" "${pkgdir}/usr/bin/gofarsi-book"

  rm -rf "${pkgdir}/usr/local"
  echo "Installed go farsi book, for run book use: gofarsi-book"
}
