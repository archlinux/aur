# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gofarsi-bin
pkgver=v2025_08_25_195904_dffa850d7
_pkgver=2025.08.25-195904-dffa850d7
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
    _sha256='0ba51f43f27748ec511d1d203ddc7666017dfd01a824e712465043941262fa5f'
    ;;
  aarch64)
    _deb="book_${_pkgver}_linux_arm64.deb"
    _sha256='5dfa41dbf69a0c7d9e6073e54752b42782a9e25dab4ba98c50e5b9e82647b6ee'
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
