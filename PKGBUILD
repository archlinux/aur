# Maintainer: seth <getchoo at tuta dot io>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=lightmaputil-git
pkgver=r65.394c0ea
pkgrel=1
pkgdesc="A simple command line utility to tell you if your lightmaps are too high resolution"
arch=('x86_64')
url="https://github.com/treacherousfiend/LightmapUtil"
license=('CC0-1.0')
makedepends=('git' 'cmake')
depends=('glibc' 'gcc-libs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/treacherousfiend/LightmapUtil")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"

	cmake -B build \
	-S "${pkgname%-git}" \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr

	cmake --build build
}

package() {
	cd "$srcdir"

	DESTDIR="$pkgdir" cmake --install build
}
