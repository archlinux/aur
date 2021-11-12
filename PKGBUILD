# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-cpp
_pkgname=cppTango
pkgver=9.3.4
pkgrel=1
pkgdesc="TANGO distributed control system - shared library"
arch=('x86_64' 'arm')
url="https://www.tango-controls.org/"
license=('GPL3')
depends=('tango-idl' 'omniorb' 'zeromq' 'doxygen' 'cmake>=3.7')
conflicts=('tango')
provides=('tango')
source=("https://gitlab.com/tango-controls/cppTango/-/archive/9.3.4/cppTango-9.3.4.tar.gz")
sha256sums=('50828ae9f523c8b2eeb546b38138b0d0882fcd3050e952d93a66a594ed178e72')
_dir="${_pkgname}-${pkgver}"

prepare() {
  mkdir -p ${_dir}/build
}

build() {
  cd ${_dir}/build
  cmake -DIDL_BASE=/usr/local -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr/ ../
}

package() {
  cd ${_dir}/build
  make DESTDIR=${pkgdir} install
}
