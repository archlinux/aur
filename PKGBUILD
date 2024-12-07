# Maintainer: mekb https://github.com/mekb-turtle
# shellcheck disable=SC2034
pkgname=foto-git
pkgver=4.0.0.r1.g38a86f3
pkgrel=1
pkgdesc='Simple image viewer written in C - Git release'
arch=('any')
url='https://github.com/mekb-turtle/Foto'
license=('MPL-2.0')
source=("foto::git+${url}.git")
sha256sums=(SKIP)
makedepends=('git' 'meson')
depends=('sdl2' 'sdl2_image')
provides=('foto')
conflicts=('foto')

package() {
	cd "$srcdir/foto" || exit 1
	meson install -C build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
build() {
	cd "$srcdir/foto" || exit 1
	meson setup build --prefix="$pkgdir/usr"
	meson compile -C build
}
pkgver() {
	cd foto && git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}
