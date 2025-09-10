# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gofarsi-bin
pkgver=v2025_09_10_121123_3f350c1b0
_pkgver=2025.09.10-121123-3f350c1b0
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
    _sha256='e7c42a33c6a8ebe54aad3070d9cc1a4f57c66d22ec7a80df044aab25fcd2e8a1'
    ;;
  aarch64)
    _deb="book_${_pkgver}_linux_arm64.deb"
    _sha256='86e8fdd307e65cdf5297c406f091d5e46cf3c3a29bae384f3a713934f45f3d83'
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
