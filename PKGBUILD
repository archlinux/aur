# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python2-sip
pkgver=4.19.24
pkgrel=1
arch=('x86_64')
url='https://www.riverbankcomputing.com/software/sip/intro'
license=('custom:"sip"')
makedepends=('python2')
source=("https://www.riverbankcomputing.com/static/Downloads/sip/$pkgver/sip-$pkgver.tar.gz")
sha256sums=('edcd3790bb01938191eef0f6117de0bf56d1136626c0ddb678f3a558d62e41e5')

prepare() {
  mkdir -p build-py2
}

build() {
  cd "$srcdir"/build-py2
  python2 ../sip-$pkgver/configure.py CFLAGS="$CFLAGS" LFLAGS="$LDFLAGS"
  make
}

package() {
  cd build-py2
  make DESTDIR="$pkgdir" install
  install -Dm644 ../sip-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  rm -r "$pkgdir"/usr/{bin,include} # conflicts with sip
}
