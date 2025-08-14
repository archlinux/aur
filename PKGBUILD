# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gofarsi-bin
pkgver=2025_08_13_215153_470de116e
_pkgver=2025.08.13-215153-470de116e
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
    _sha256='004b3750741cef1acc0e279113dd20a5efa0d54022db62b9e9955ff6eebafa8f'
    ;;
  aarch64)
    _deb="book_${_pkgver}_linux_arm64.deb"
    _sha256='1ff094dbf94d1096ecef674831e8d6f590efe29e050a56e452e867aa448c8628'
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
