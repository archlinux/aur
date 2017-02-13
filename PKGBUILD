# Maintainer: Iru Cai <mytbk920423@gmail.com>

pkgname=libmypaint-git
pkgver=1.3.0.4.g4d5bf27
pkgrel=1
pkgdesc="a library for making brushstrokes which is used by MyPaint and other projects, with GEGL support"
arch=('i686' 'x86_64')
url="http://mypaint.org/"
license=('ISC')
depends=('gobject-introspection' 'json-c' 'gegl')
makedepends=('git' 'intltool' 'python')
source=('git+https://github.com/mypaint/libmypaint.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/libmypaint"

  ./autogen.sh
  ./configure --prefix=/usr --enable-gegl
  make
}

package() {
  cd "$srcdir/libmypaint"

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
  cd "$srcdir/libmypaint"

  git describe --tags | sed 's/^v//g;s/-/./g'
}

# vim:set ts=2 sw=2 et:
