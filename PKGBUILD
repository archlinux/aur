# Original contributor: Karro <karolina.lindqvist@kramnet.se>
#
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: SneakySnake <radiantstatue@gmail.com>

pkgname=libim
pkgver=3.12
pkgrel=2
pkgdesc="Toolkit for Digital Imaging"
arch=('i686' 'x86_64')
url="http://www.tecgraf.puc-rio.br/im/"
depends=('gcc-libs' 'zlib' 'libpng')
optdepends=('lua51: bindings for Lua are available'
            'fftw: for fft support')
license=('custom')
options=('staticlibs')
source=(
  "http://downloads.sourceforge.net/project/imtoolkit/${pkgver}/Docs%20and%20Sources/im-${pkgver}_Sources.tar.gz"
  "http://downloads.sourceforge.net/project/imtoolkit/${pkgver}/Docs%20and%20Sources/im-${pkgver}_Docs.pdf"
  LICENSE
)
md5sums=('50d6a03bb1e73fcc62633f2535494733'
         '4e5ba38f84cb7a107110318764707d87'
         '214b5ab19962418fa755a45b35504219')
noextract=(im-${pkgver}_Sources.tar.gz)

build() {
  tar xf im-${pkgver}_Sources.tar.gz # sources have a problem with bsdtar, use gnutar instead
  cd im
  make -k
}

package() {
  install -m755 -d "$pkgdir"/usr/lib
  install -m644 "$srcdir"/im/lib/Linux*/libim* "$pkgdir"/usr/lib
  install -m755 -d "$pkgdir"/usr/share/$pkgname
  install -m644 "$srcdir"/im-${pkgver}_Docs.pdf "$pkgdir"/usr/share/$pkgname
  install -m755 -d "$pkgdir"/usr/include/im
  install -m644 "$srcdir"/im/include/* "$pkgdir"/usr/include/im
  install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/libim/LICENSE
  install -d "$pkgdir"/usr/lua/5.1/
  install -Dm644 "$srcdir"/im/lib/Linux48_64/Lua51/*.so "$pkgdir"/usr/lua/5.1/
}
