# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gofarsi-bin
pkgver=6.1.4
pkgrel=1
pkgdesc="Free Persian Go programming language book"
arch=('x86_64' 'aarch64')
url="https://github.com/GoFarsi/book"
license=('CC0-1.0')
depends=()
provides=('gofarsi' 'gofarsi-book')
conflicts=('gofarsi-book')

case "$CARCH" in
  x86_64)
    _deb="book_${pkgver}_linux_amd64.deb"
    _sha256='ea7727b1588b958990421622a57001daf719b7282a02acac057265438881f375'
    ;;
  aarch64)
    _deb="book_${pkgver}_linux_arm64.deb"
    _sha256='6508a35a2e1a08d66e0e5c918a91136870e03b12ec20da5a222a9e207fbc75e6'
    ;;
  *)
    echo "Unsupported architecture: $CARCH"
    exit 1
    ;;
esac

source=("$_deb::https://github.com/GoFarsi/book/releases/download/v${pkgver}/${_deb}")
sha256sums=("$_sha256")

package() {
  bsdtar -xf "${srcdir}/${_deb}"
  bsdtar -xf data.tar.gz -C "${pkgdir}/"

  install -Dm755 "${pkgdir}/usr/local/bin/book" "${pkgdir}/usr/bin/gofarsi-book"

  rm -rf "${pkgdir}/usr/local"
}
