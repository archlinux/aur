# AdPlug's UNIX console-based frontend
# Maintainer: Jerry Xiao <isjerryxiao at outlook dot com>

_srcname=adplay-unix
pkgname=adplay-git
pkgver=1.8.2.gccd1b88
pkgrel=1
pkgdesc="AdPlug's UNIX console-based frontend"
arch=('i686' 'x86_64')
url="https://github.com/adplug/adplay-unix"
license=('GPL')
depends=('adplug-git')
provides=('adplay')
conflicts=('adplay')
source=(
  "${_srcname}::git+https://github.com/adplug/adplay-unix.git#branch=master"
)
md5sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/${_srcname}"
  git describe --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "$srcdir/${_srcname}"
  autoreconf --install
}

build() {
  cd "$srcdir/${_srcname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_srcname}"
  make DESTDIR="$pkgdir" install
}
