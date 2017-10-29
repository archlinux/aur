pkgname=itstool-legacy
pkgver=2.0.2+5+g676f3f7
pkgrel=1
pkgdesc="XML to PO and back again"
arch=(any)
url="http://itstool.org/"
license=(GPL3)
depends=('python2' 'libxml2')
provides=('itstool')
conflicts=('itstool')
makedepends=(git)
_commit=676f3f738b21ec4d77f300f83d31d2d0eceaddcc
source=("git+https://github.com/itstool/itstool#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-legacy}
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd ${pkgname%-legacy}
  autoreconf -fi
  export PYTHON=/usr/bin/python2
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname%-legacy}
  make -k check
}

package() {
  cd ${pkgname%-legacy}
  make DESTDIR="$pkgdir" install
}
