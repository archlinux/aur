# Contributor: Antoine Viallon <antoine at lesviallon dot fr>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: Jon Sturm <jasturm002@aol.com>
# Contributor: Scott Garrett <Wintervenom@archlinux.us>

_name=tilibs
pkgname=libticalcs-git
pkgver=1.18.r127.g791d2535
pkgrel=1
pkgdesc="TI Calculator library"
arch=('i686' 'x86_64')
url="http://lpg.ticalc.org/prj_tilp/"
license=('GPL-2.0-only')
depends=('glibc' 'glib2' 'libticables-git' 'libtifiles-git')
makedepends=('git')
options=('!libtool')
conflicts=('libticalcs')
provides=('libticalcs')
source=(${_name}::git+https://github.com/debrouxl/tilibs.git)
md5sums=('SKIP')


pkgver() {
  cd ${_name}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_name}/${pkgname%-*}/trunk
  autoreconf -fi
}

build() {
  cd ${_name}/${pkgname%-*}/trunk
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_name}/${pkgname%-*}/trunk
  make install DESTDIR="${pkgdir}"
}
