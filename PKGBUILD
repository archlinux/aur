# Original contributor: Karro <karolina.lindqvist@kramnet.se>
#
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: SneakySnake <radiantstatue@gmail.com>
# Submit issues/pull requests at https://github.com/crumblingstatue/aur-libim

pkgname=libim
pkgver=3.10
pkgrel=1
pkgdesc="Toolkit for Digital Imaging"
arch=('i686' 'x86_64')
url="http://www.tecgraf.puc-rio.br/im/"
depends=('gcc-libs' 'zlib')
optdepends=('lua: bindings for Lua are available'
            'fftw: for fft support')
license=('custom')
options=('staticlibs')

source=(
  "http://downloads.sourceforge.net/project/imtoolkit/${pkgver}/Docs%20and%20Sources/im-${pkgver}_Sources.tar.gz"
  "http://downloads.sourceforge.net/project/imtoolkit/${pkgver}/Docs%20and%20Sources/im-${pkgver}_Docs.pdf"
  LICENSE
)
md5sums=('4526ef2c47038a96648715361cc23004'
         '03b43b566291a9a4d47eb0f3a34c36de'
         '214b5ab19962418fa755a45b35504219')

build() {
  cd "$srcdir"/im
  make
}

package() {
  install -m755 -d "$pkgdir"/usr/lib
  install -m644 "$srcdir"/im/lib/Linux*/libim* "$pkgdir"/usr/lib
  install -m755 -d "$pkgdir"/usr/share/$pkgname
  install -m644 "$srcdir"/im-${pkgver}_Docs.pdf "$pkgdir"/usr/share/$pkgname
  install -m755 -d "$pkgdir"/usr/include/im
  install -m644 "$srcdir"/im/include/* "$pkgdir"/usr/include/im
  mkdir -p "$pkgdir"/usr/share/licenses/libim
  install -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/libim
}
