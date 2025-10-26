# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-micro-xrce-dds-agent
pkgver=3.0.1
pkgrel=1
pkgdesc="eProsima's XRCE DDS agent"
arch=('x86_64')
url="https://github.com/eProsima/Micro-XRCE-DDS-Agent"
license=('Apache')
depends=('eprosima-micro-xrce-dds-client' 'eprosima-fast-cdr>=1.0.27' 'foonathan_memory' 'eprosima-fast-dds' 'cli11' 'spdlog')
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
source=("https://github.com/eProsima/Micro-XRCE-DDS-Agent/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('489b51d059febf8a2736becb5790ac593784c7d42b821d0d4b2e2f6d197c46a2')
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
    cmake --build build --parallel 8
}

package() {
    cd "Micro-XRCE-DDS-Agent-$pkgver"
    make -C build DESTDIR="$pkgdir/" install
}
