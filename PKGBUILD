# Maintainer: Luigi311 <aur@luigi311.com>
pkgname=libmegapixels-git
pkgver=r65.3669b8a
pkgrel=1
pkgdesc='Interface library between libtiff and the world to make sure the output is valid DNG'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/megapixels-org/libmegapixels"
branch="master"
license=('GPL3')
depends=('libdng')
makedepends=('meson' 'libconfig')
checkdepends=()
optdepends=()
provides=('libmegapixels')
conflicts=('libmegapixels')
replaces=('libmegapixels')
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