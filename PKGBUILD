# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-micro-xrce-dds-agent
pkgver=2.4.0
pkgrel=1
pkgdesc="eProsima's XRCE DDS agent"
arch=('x86_64')
url="https://github.com/eProsima/Micro-XRCE-DDS-Agent"
license=('Apache')
depends=('eprosima-micro-xrce-dds-client' 'eprosima-fast-cdr>=1.0.27' 'foonathan_memory-shared' 'eprosima-fast-dds' 'cli11' 'spdlog')
makedepends=('cmake' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/eProsima/Micro-XRCE-DDS-Agent/archive/v${pkgver}.tar.gz"
        "git+https://github.com/arsenm/sanitizers-cmake.git")
noextract=()
sha256sums=('8a9ebb3217e390a5db55db9bffb0226353f28714361bb2317e6df073df35236b'
            'SKIP')
validpgpkeys=()

build() {
    cd "Micro-XRCE-DDS-Agent-$pkgver"
    cmake -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DUAGENT_ISOLATED_INSTALL=OFF \
          -DUAGENT_SUPERBUILD=OFF \
          -DUAGENT_LOGGER_PROFILE=OFF \
          -DCMAKE_MODULE_PATH="$srcdir/sanitizers-cmake/cmake/" \
          .
    make -C build
}

package() {
    cd "Micro-XRCE-DDS-Agent-$pkgver"
    make -C build DESTDIR="$pkgdir/" install
}
