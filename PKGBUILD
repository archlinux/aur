# Maintainer: twxt <aur@twxt.cc>

pkgname=openmodsim
_pkgname_caps=OpenModSim
pkgver=2.2.0
_pkgver_fmt=${pkgver/.rc/-rc}
pkgrel=1
pkgdesc="Open ModSim is a free implimentation of modbus slave (server) utility for modbus-tcp and modbus-rtu protocols."
arch=('x86_64' 'i686')
url="https://github.com/sanny32/openmodsim"
license=('MIT')
depends=('gcc' 'qt6-base>=6.8' 'qt6-declarative' 'qt6-5compat' 'qt6-tools' 'qt6-serialport' 'qt6-serialbus' 'qt6-svg')
makedepends=('cmake')
optdepends=('openmodscan: for a Modbus master (client)')
provides=('openmodsim')
conflicts=('openmodsim')
options=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sanny32/OpenModSim/archive/refs/tags/${_pkgver_fmt}.tar.gz")
sha256sums=('ea37542e57c6b3531e34e592720a814880e6412915b8d50ad164e28aa9ab7908')

prepare() {
  cd "${srcdir}/${_pkgname_caps}-${_pkgver_fmt}"
  cmake \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR:STRING=lib \
    -DCMAKE_BUILD_TYPE="RelWithDebInfo"\
    src/
}

build() {
  cd "${srcdir}/${_pkgname_caps}-${_pkgver_fmt}"
  make
}

package() {
  cd "${srcdir}/${_pkgname_caps}-${_pkgver_fmt}"
  make DESTDIR="$pkgdir/" install
  install -Dm0644 "./LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
