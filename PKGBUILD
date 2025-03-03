# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: The OpenTelemetry C/C++ special interest group (SIG)
#         meets regularly. See the OpenTelemetry community repo for
#         information on this and other language SIGs.
#         (https://github.com/open-telemetry/community)


pkgname=opentelemetry-cpp
_pkgname=opentelemetry-cpp
_pkgver="1.19.0"
pkgver="1.19.0"
pkgrel=1
pkgdesc="The C++ OpenTelemetry client."
arch=('x86_64')
url="https://github.com/open-telemetry/"
license=('Apache')
depends=('grpc' 'nlohmann-json' 'benchmark' 'abseil-cpp' 'protobuf' 'nlohmann-json')
makedepends=('doxygen' 'cmake')
source=("https://github.com/open-telemetry/opentelemetry-cpp/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('e0330194b72f2fe4c0ce3ece06b02dc4aa0ab491eb75bf42c6f5e283912e468c')

_dir="${_pkgname}-${_pkgver}"

build() {
  cmake -B build -S "${_pkgname}-${_pkgver}" -DCMAKE_INSTALL_PREFIX=/usr \
	-DWITH_OTLP_GRPC=ON -DWITH_OTLP_HTTP=ON -DBUILD_SHARED_LIBS=ON \
	-DCMAKE_POSITION_INDEPENDENT_CODE=ON
  make -C build
}

package() {
  make -C build DESTDIR=${pkgdir} install
}
