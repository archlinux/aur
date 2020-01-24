# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python2-sip
pkgver=4.19.19
pkgrel=1
arch=('x86_64')
url='https://www.riverbankcomputing.com/software/sip/intro'
license=('custom:"sip"')
makedepends=('python2')
source=("https://www.riverbankcomputing.com/static/Downloads/sip/$pkgver/sip-$pkgver.tar.gz")
sha256sums=('5436b61a78f48c7e8078e93a6b59453ad33780f80c644e5f3af39f94be1ede44')

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
