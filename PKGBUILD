# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gofarsi-bin
pkgver=v2026.02.22_071121_683c119a6
_pkgver=2026.02.22-071121-683c119a6
pkgrel=1
pkgdesc="Free Persian the Go programming language book"
arch=('x86_64' 'aarch64')
url="https://github.com/GoFarsi/book"
license=('CC0-1.0')
depends=()
provides=('gofarsi' 'gofarsi-book')
conflicts=('gofarsi-book')

case "$CARCH" in
  x86_64)
    _deb="book_${_pkgver}_linux_amd64.deb"
    _sha256='833c09f220c40914c08e00f2a375fc8ebae9d2a9bc495e498e9a57e66928f027'
    ;;
  aarch64)
    _deb="book_${_pkgver}_linux_arm64.deb"
    _sha256='953eb73298293be6e2a3a19f57830abc576dfb08539bef5cca4b4ce86665d3d2'
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
