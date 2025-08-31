# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gofarsi-bin
pkgver=v2025_08_30_121120_409948ddf
_pkgver=2025.08.30-121120-409948ddf
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
    _deb="book_${_pkgver}_linux_amd64.deb"
    _sha256='928fc2fe1b4424fd56ea00299b0a22ed0fdda5ddfaa215972306ab97f1343ee6'
    ;;
  aarch64)
    _deb="book_${_pkgver}_linux_arm64.deb"
    _sha256='d2992ba4279acbc746e98850c78c50ac26607a7adf9b0dc715a73447ab4de28de'
    ;;
  *)
    echo "Unsupported architecture: $CARCH"
    exit 1
    ;;
esac

source=("$_deb::https://github.com/GoFarsi/book/releases/download/v${_pkgver}/${_deb}")
sha256sums=("$_sha256")

package() {
  bsdtar -xf "${srcdir}/${_deb}"
  bsdtar -xf data.tar.gz -C "${pkgdir}/"

  install -Dm755 "${pkgdir}/usr/local/bin/book" "${pkgdir}/usr/bin/gofarsi-book"

  rm -rf "${pkgdir}/usr/local"
}
