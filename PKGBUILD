# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: nsf <no.smile.face@gmail.com>

pkgname=bmpanel2
pkgver=2.1pre1
pkgrel=5
pkgdesc="A NETWM-compatible panel for X11"
arch=("i686" "x86_64")
url="http://bmpanel2.googlecode.com/"
license=('custom:MIT')
depends=('libxext' 'pango')
optdepends=('pygtk: configuration GUI')
makedepends=('cmake' 'asciidoc' 'python2')
source=("${url}files/$pkgname-$pkgver.tar.gz")
md5sums=('766ce5d3d6be427192fa11883b230eed')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  [ -d bld ] || mkdir bld && cd bld

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=RELEASE \
           -DPYTHON_EXECUTABLE=/usr/bin/python2
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/bld"
  make DESTDIR="$pkgdir/" install

  # python2 fix
  sed -i 's/env python/&2/' `find "$pkgdir" -name "*.py"`

  # license
  install -Dm644 ../COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
