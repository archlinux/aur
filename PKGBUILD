# Maintainer: Eric Pfeiffer <aur@computerfr33k.com>
pkgname=librevault
pkgver=0.1.18.8
pkgrel=1
pkgdesc="File synchronization designed with privacy in mind"
arch=(x86_64 i686)
url="https://librevault.com/"
license=('GPL3')
groups=()
makedepends=('git' 'cmake' 'boost' 'qt5-tools')
depends=(
        'qt5-websockets' 'qt5-svg' 'protobuf3>=3.0.0-1' 'boost-libs'
        'crypto++' 'miniupnpc' 'websocketpp' 'qt5-base'
        'openssl' 'libnatpmp' 'sqlite'
)
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
source=(
	"git+https://github.com/Librevault/librevault.git#tag=v$pkgver"
)
noextract=()
sha256sums=('SKIP')

prepare() {
	mkdir -p ${srcdir}/${pkgname}/build && cd ${srcdir}/${pkgname}/build
	git submodule update --init
	cmake -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DWITH_TESTS=OFF \
	-DWITH_EXAMPLE=OFF ..
}

build() {
        cd ${srcdir}/${pkgname}/build
        cmake --build .
}

package() {
	cd ${srcdir}/${pkgname}/build
	make DESTDIR="$pkgdir" install
}
