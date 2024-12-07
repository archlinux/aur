# Maintainer: mekb https://github.com/mekb-turtle
# shellcheck disable=SC2034
pkgname=foto
pkgver=4.0.0
pkgrel=1
pkgdesc='Simple image viewer written in C'
arch=('any')
url='https://github.com/mekb-turtle/Foto'
license=('MPL-2.0')
source=("foto::git+${url}.git#tag=v$pkgver")
sha256sums=(SKIP)
makedepends=('git' 'meson')
depends=('sdl2' 'sdl2_image')
provides=('foto')

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
