# Maintainer: Luigi311 <aur@luigi311.com>
pkgname=libdng-git
pkgver=r43.9c7b18e
pkgrel=1
pkgdesc='Interface library between libtiff and the world to make sure the output is valid DNG'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/megapixels-org/libdng"
branch="master"
license=('MIT')
depends=()
makedepends=('meson' 'libtiff' 'scdoc')
checkdepends=()
optdepends=()
provides=('libdng')
conflicts=('libdng')
replaces=('libdng')
source=("${pkgname}::git+${url}.git#branch=${branch}")
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