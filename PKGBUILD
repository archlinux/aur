# Maintainer: mekb https://github.com/mekb-turtle
# shellcheck disable=SC2034
pkgname=foto-git
pkgver=2.0.2.r0.g4af6884
pkgrel=1
pkgdesc='Simple image viewer written in C - Git release'
arch=('any')
url='https://github.com/mekb-turtle/foto'
license=('MPL-2.0')
source=("foto::git+${url}.git")
sha256sums=(SKIP)
makedepends=('git' 'pandoc')
depends=('sdl2' 'sdl2_image')
provides=('foto')
conflicts=('foto')

package() {
	make RELEASE=1 INSTALL_DIR="$pkgdir/usr" -C "$srcdir/foto" install
}
build() {
	make RELEASE=1 -C "$srcdir/foto" build man
}
pkgver() {
	cd foto && git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}
