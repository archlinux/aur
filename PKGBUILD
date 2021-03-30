# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-micro-xrce-dds-agent
pkgver=2.0.0
pkgrel=1
pkgdesc="eProsima's XRCE DDS agent"
arch=('x86_64')
url="https://github.com/eProsima/Micro-XRCE-DDS-Agent"
license=('Apache')
depends=('eprosima-micro-xrce-dds-client' 'eprosima-fast-cdr' 'foonathan_memory-shared' 'eprosima-fast-dds' 'cli11' 'spdlog')
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
        "git+https://github.com/arsenm/sanitizers-cmake.git"
        'ssize_t.patch')
noextract=()
sha256sums=('aac4df9f763b38d53a0218d7c9c518d07a1ea7a3a8787eae8d99560fd3396cf5'
            'SKIP'
            '0c65544ee75e98e8e9ee5c075d869077f3511164e8ddae1de91f65972d26be9a')
validpgpkeys=()

prepare() {
    cd "Micro-XRCE-DDS-Agent-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/ssize_t.patch"
}

build() {
    cd "Micro-XRCE-DDS-Agent-$pkgver"
    cmake -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DUAGENT_ISOLATED_INSTALL=OFF \
          -DUAGENT_SUPERBUILD=OFF \
          -DCMAKE_MODULE_PATH="$srcdir/sanitizers-cmake/cmake/" \
          .
    make -C build
}

package() {
    cd "Micro-XRCE-DDS-Agent-$pkgver"
    make -C build DESTDIR="$pkgdir/" install
}
