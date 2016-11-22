# Maintainer: Eric Pfeiffer <aur@computerfr33k.com>
pkgname=librevault
pkgver=0.1.19
pkgrel=2
pkgdesc="File synchronization designed with privacy in mind"
arch=(x86_64 i686)
url="https://librevault.com/"
license=('GPL3')
groups=()
makedepends=('git' 'cmake' 'boost' 'qt5-tools')
depends=(
        'qt5-websockets' 'qt5-svg' 'protobuf>=3.0.2-2'
        'crypto++' 'miniupnpc' 'websocketpp' 'qt5-base'
        'openssl' 'libnatpmp' 'sqlite' 'boost-libs'
)
conflicts=("$pkgname-git")
replaces=()
backup=()
options=()
install=
source=(
	"librevault::git+https://github.com/Librevault/librevault.git#tag=v$pkgver"
)
noextract=()
sha256sums=('SKIP')

prepare() {
	mkdir -p build
	cd "$srcdir/librevault"
	
	# Configure Submodules
	git submodule update --init
}

build() {
    cd build

    cmake -DCMAKE_BUILD_TYPE=Release \
   	    -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_UPDATER=OFF \
        "$srcdir/librevault"

    make
}

package() {
	cd build

	make DESTDIR="$pkgdir" install
}
