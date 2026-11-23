# Maintainer: twxt <aur@twxt.cc>

pkgname=openmodscan
_pkgname_caps=OpenModScan
pkgver=1.16.2
pkgrel=1
pkgdesc="OpenModScan is a free and open-source Modbus Master (Client) utility supporting both Modbus-TCP and Modbus-RTU protocols."
arch=('x86_64' 'i686')
url="https://github.com/sanny32/openmodscan"
license=('MIT')
depends=('gcc' 'qt6-base' 'qt6-tools' 'qt6-serialport' 'qt6-serialbus' 'qt6-declarative' 'qt6-5compat')
makedepends=('cmake')
optdepends=('openmodsim: for simulating a Modbus slave (server)')
provides=('openmodscan')
conflicts=('openmodscan')
options=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sanny32/OpenModScan/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a74814f402090cec488e2d9d55fd3e0e22e28568d593994bd1b7e1f290ddfb5a')

prepare() {
  cd "${srcdir}/${_pkgname_caps}-${pkgver}"
  cmake \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR:STRING=lib \
    -DCMAKE_BUILD_TYPE="RelWithDebInfo"\
    src/
}

build() {
  cd "${srcdir}/${_pkgname_caps}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_pkgname_caps}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  install -Dm0644 "./LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
