# Maintainer: Thomas Schneider <maxmusterm@gmail.com>
pkgname=svt-av1-git
pkgver=r125.a30e1f6
pkgrel=1
pkgdesc="The Scalable Video Technology for AV1 Encoder (SVT-AV1 Encoder) is an AV1-compliant encoder library core."
arch=('x86_64' 'i686')
url="https://github.com/OpenVisualCloud/SVT-AV1"
license=('GPL')
groups=()
depends=()
makedepends=('cmake' 'gcc' 'yasm' 'git')
checkdepends=()
optdepends=()
provides=('svt-av1')
conflicts=()
replaces=('svt-av1')
backup=()
options=()
install=
changelog=
source=(svt-av1::git+https://github.com/OpenVisualCloud/SVT-AV1.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE='Release' \
	-DCMAKE_INSTALL_PREFIX='/usr' \
	-DBUILD_TESTING=False
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"/build
	make DESTDIR="$pkgdir/" install
}

