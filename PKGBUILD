# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-micro-xrce-dds-agent
pkgver=1.4.0
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
        "no-exact-version-requirements.patch")
noextract=()
sha256sums=('f5e6eb4ae78f3f994a3775194bf2b571d15bbaaf07d5bf158ac10292d0c0d6bd'
            'SKIP'
            'baaddf35d538769a3af8d572ddbc55a12abbf51fa0f97f55272d805a57d9794c')
validpgpkeys=()

prepare() {
    cd "Micro-XRCE-DDS-Agent-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/no-exact-version-requirements.patch"
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
