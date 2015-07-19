# Maintainer: Can Altıparmak (gulaghad) <can6parmak <AT> gmail <DOT> com>

pkgname=atdtool
pkgver='1.3'
pkgrel=1
pkgdesc="After the Deadline command-line tool."
arch=('any')
url="https://github.com/lpenz/atdtool"
license=('BSD')
depends=('python2')
makedepends=('txt2tags')
source=("https://github.com/lpenz/atdtool/archive/upstream/$pkgver.tar.gz")
md5sums=('f20ce3822ff1dc0e7cae235340d0d3ad')

build() {
  cd "${srcdir}/${pkgname}-upstream-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-upstream-${pkgver}"
  make PREFIX="$pkgdir/usr" install
  sed -i 's/python/python2/g' "$pkgdir/usr/bin/$pkgname"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -D -m644 "${srcdir}/${pkgname}-upstream-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

