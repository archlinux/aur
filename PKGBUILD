# Maintainer: Marat Moustafine <moustafine-@t-tuta-d.t-io>

_pkgname=dbus-c++
pkgname=$_pkgname-git
pkgver=latest
pkgrel=1
pkgdesc='A C++ API for D-BUS'
arch=('i686' 'x86_64')
_reponame=dbus-cplusplus
url=https://github.com/andreas-volz/$_reponame
license=('GPL')
depends=('dbus' 'glib2')
makedepends=('autoconf' 'automake' 'git' 'libtool')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+$url.git
        port-to-gcc-7.patch)
sha256sums=('SKIP'
            '0d32460ea38d162d648da27a7341c8514d09e987a7bd2c957ef746a2faf27c7c')

pkgver() {
  cd $_reponame
  git describe --long --tags | sed -r 's/^[r|v]//;s/-/+/g'
}

prepare() {
  cd $_reponame
  patch -p1 -i $srcdir/${source[1]}
}

build () {
  cd $_reponame
  ./autogen.sh \
    --prefix=/usr \
    --disable-static \
    --enable-glib \
    --disable-ecore \
    --disable-examples
  make
}

package() {
  cd $_reponame
  make DESTDIR=$pkgdir install
}
