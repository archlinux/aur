# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: The OpenTelemetry C/C++ special interest group (SIG)
#         meets regularly. See the OpenTelemetry community repo for
#         information on this and other language SIGs.
#         (https://github.com/open-telemetry/community)


pkgname=opentelemetry-cpp
_pkgname=opentelemetry-cpp
_pkgver="1.17.0"
pkgver="1.17.0"
pkgrel=2
groups=('tango-controls')
pkgdesc="TANGO distributed control system - shared library"
arch=('x86_64')
url="https://gitlab.com/tango-controls/${_pkgname}"
license=('Apache')
depends=('benchmark' 'abseil-cpp' 'protobuf')
makedepends=('doxygen' 'cmake')
source=("https://github.com/open-telemetry/opentelemetry-cpp/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('13542725463f1ea106edaef078c2276065cf3da998cb1d3dcf92630daa3f64d4')

_dir="${_pkgname}-${_pkgver}"

build() {
  cmake -B build -S "${_pkgname}-${_pkgver}" -DCMAKE_INSTALL_PREFIX=/usr -DWITH_OTLP_GRPC=ON
  make -C build
}

package() {
  make -C build DESTDIR=${pkgdir} install
}
