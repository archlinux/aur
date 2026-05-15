# Maintainer: RivenSkaye <riven@skaye.blog>
# Contributor: eientei95 <einstein95 at windowslive dot com>

_pkgname=gbe-plus-rec
pkgname=${_pkgname}-git
pkgver=r4915.95891bf1
pkgrel=1
pkgdesc="DMG/GBC/GBA emulator and experimental NDS emulator."
arch=('x86_64')
url="https://github.com/shonumi/gbe-plus"
license=('GPL2')
depends=('qt5-base' 'sdl2_net' 'sdl2_image')
makedepends=('cmake' 'git')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}", "gbe-plus", "gbe-plus-git")
source=("git+https://github.com/shonumi/gbe-plus.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p "$srcdir/${_pkgname}/build"
	cd "$srcdir/${_pkgname}/build"
	cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DIMAGE_FORMATS=ON
	make
}

package() {
	cd "$srcdir/${_pkgname}/build"
	make DESTDIR="$pkgdir" install
}
