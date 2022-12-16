# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=pinephone-compass-git
pkgver=0.3.1
pkgrel=2
pkgdesc="A simple GTK3 compass app for the Pine64 Pinephone."
url="https://gitlab.com/lgtrombetta/pinephone-compass"
license=('GPL3')
arch=( 'any' )
depends=('gtk3' 'libhandy' 'gettext' 'python-numpy' 'python-matplotlib' 'python-pandas' 'python-pyxdg')
makedepends=(git gcc pkgconf meson python)
provides=(pinephone-compass)
conflicts=(pinephone-compass)
source=("git+https://gitlab.com/lgtrombetta/pinephone-compass.git")
md5sums=('SKIP')

pkgver() {
    cd pinephone-compass
    git tag | sort -r | head -1 | cut -c2-
}

build() {
	cd "${srcdir}/pinephone-compass"
	meson build
}

package() {
	cd "${srcdir}/pinephone-compass/build"
	DESTDIR="$pkgdir" ninja install
}

