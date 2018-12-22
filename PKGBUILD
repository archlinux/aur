# Maintainer: Tony Lambiris <tony@criticalstack.com>
pkgname=aws-sdk-cpp-git
pkgver=1.7.25.r0.g170ba36622
pkgrel=1
epoch=
pkgdesc="AWS SDK for C++"
arch=(any)
url="https://github.com/aws/aws-sdk-cpp"
license=('BSD')
groups=()
depends=('cmake')
makedepends=('openssl' 'curl' 'zlib' 'libutil-linux')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/aws/aws-sdk-cpp")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd ${pkgname}

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${pkgname}

    CMAKE_FLAGS="-Wno-dev \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_INSTALL_INCLUDEDIR=/usr/include \
		-DCMAKE_BUILD_TYPE=Release \
		-DENABLE_TESTING=OFF \
		-DSTATIC_LINKING=1 \
		-DNO_HTTP_CLIENT=1 \
		-DMINIMIZE_SIZE=ON \
		-DBUILD_SHARED_LIBS=OFF"
    cmake $CMAKE_FLAGS .

	make ${MAKEFLAGS}
}

package() {
	cd ${pkgname}

	make DESTDIR="${pkgdir}" install
}
