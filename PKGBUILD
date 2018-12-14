# Maintainer: Tony Lambiris <tony@criticalstack.com>
pkgname=aws-checksums-git
pkgver=r22.b06b1f7
pkgrel=1
epoch=
pkgdesc='Cross-Platform HW accelerated CRC32c and CRC32 with fallback to efficient SW implementations.'
arch=(any)
url="https://github.com/awslabs/aws-checksums"
license=('BSD')
groups=()
depends=('cmake')
makedepends=('openssl' 'curl' 'zlib' 'libutil-linux')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/awslabs/aws-checksums")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd ${pkgname}

	#git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${pkgname}

    CMAKE_FLAGS="-Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=OFF"
    cmake $CMAKE_FLAGS .

	make ${MAKEFLAGS}
}

package() {
	cd ${pkgname}

	make DESTDIR="${pkgdir}" install
}
