# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
pkgname=nanosvg-git
pkgver=r122.07a5e2a
pkgrel=1
pkgdesc="Simple stupid SVG parser."
arch=("x86_64")
url="https://github.com/memononen/nanosvg"
license=('ZLIB')
groups=()
depends=('glfw' 'glu')
makedepends=('git' 'premake' 'patch')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=('nanosvg::git+https://github.com/memononen/nanosvg')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	premake5 gmake
	cd build
	make config=release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D src/nanosvg.h ${pkgdir}/usr/include/nanosvg.h
	install -D src/nanosvgrast.h ${pkgdir}/usr/include/nanosvgrast.h
	install -D LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE.txt.
}
