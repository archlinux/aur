
pkgname=python-oqapy-iproc
_pkgname=py3-oqapy-iproc
pkgver=0.2.0
pkgrel=1
pkgdesc='Python binding for the lib oqapy-iproc'
depends=(liboqapy-iproc gcc-libs python-sip)
makedepends=(python-sip)
arch=(i686 x86_64)
url="http://www.oqapy.eu/"
license=('GPL')
provides=($_pkgname)
source=(
https://launchpad.net/oqapy/trunk/oqapy/+download/$_pkgname-$pkgver.tar.gz
configure.py.patch
)
sha256sums=('7e023a5ca63b403f1a698ad31dde929377d60ce665606670f790338bd4dc30ae'
            '12a92ea1460c78ac04cdb17811cbb4bddc3e05c64ba3e3d1df7d7f3c1b454dbc')
prepare() {
  cd $srcdir/$_pkgname-$pkgver
  patch -p1 -i $srcdir/configure.py.patch
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  python ./configure.py
  make
}
package() {
  cd $srcdir/$_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
