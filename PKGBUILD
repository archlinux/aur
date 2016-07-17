# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

_pkgname=psmoveapi
pkgname=${_pkgname}-git
pkgver=3.9.1.r97.gf08c337
pkgrel=1
pkgdesc="Playstation Move Motion Controller API"
arch=(i686 x86_64)
url="http://thp.io/2010/psmove/"
license=('GPL2')
depends=('bluez-libs' 'libsystemd')
makedepends=('cmake')
source=(${_pkgname}::git+git://github.com/thp/${_pkgname}.git)
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git submodule update
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DPSMOVEAPI_LIB_DEST=lib .
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}

