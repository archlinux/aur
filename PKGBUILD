# Maintainer: Thomas Schneider <maxmusterm@gmail.com>
pkgname=svt-vp9-git
pkgver=r6.e92a57c
pkgrel=1
pkgdesc="The Scalable Video Technology for VP9 Encoder (SVT-VP9 Encoder) is an VP9-compliant encoder library core."
arch=('x86_64' 'i686')
url="https://github.com/OpenVisualCloud/SVT-VP9"
license=('GPL')
groups=()
depends=()
makedepends=('cmake' 'gcc' 'yasm' 'git')
checkdepends=()
optdepends=()
provides=('svt-vp9')
conflicts=()
replaces=('svt-vp9')
backup=()
options=()
install=
changelog=
source=(svt-vp9::git+https://github.com/OpenVisualCloud/SVT-VP9.git)
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
	-DCMAKE_INSTALL_PREFIX='/usr'
#	-DBUILD_TESTING=False
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"/build
	make DESTDIR="$pkgdir/" install
}

