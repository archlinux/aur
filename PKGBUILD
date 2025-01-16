# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-cpp
_pkgname=cppTango
_pkgver="10.0.0"
pkgver="10.0.0"
pkgrel=1
groups=('tango-controls')
pkgdesc="TANGO distributed control system - shared library"
arch=('x86_64' 'armv7h')
url="https://gitlab.com/tango-controls/${_pkgname}"
license=('GPL3')
depends=('tango-idl' 'omniorb>=4.3.0' 'zeromq' 'cppzmq' 'libjpeg-turbo' 'opentelemetry-cpp' 'catch2')
makedepends=('doxygen' 'cmake>=3.18')
conflicts=('tango')
source=("git+https://gitlab.com/tango-controls/cppTango.git#tag=${_pkgver}")
sha256sums=('SKIP')

_dir="${_pkgname}"

build() {
  cd ${_dir}
  cmake -B build -DTANGO_USE_TELEMETRY=OFF -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd ${_dir}
  make -C build DESTDIR=${pkgdir} install
}
