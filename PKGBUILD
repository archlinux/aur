# Maintainer: Luigi311 <aur@luigi311.com>
pkgname=megapixels-git
pkgver=r476.3ed974a
pkgrel=1
pkgdesc='GTK4 camera application that knows how to deal with the media request api'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/megapixels-org/Megapixels"
license=('LGPL')
depends=('gtk4' 'zbar' 'feedbackd' 'libdng' 'libmegapixels' 'postprocessd')
makedepends=('meson')
checkdepends=()
optdepends=()
provides=('megapixels')
conflicts=('megapixels')
replaces=('megapixels')
source=(megapixels-git::git+https://gitlab.com/megapixels-org/Megapixels.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson ${pkgname} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
