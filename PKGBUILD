# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=stilo-themes-git
pkgver=r235.a6be3a8
pkgrel=1
pkgdesc="Minimalistic GTK themes"
arch=('any')
url="https://github.com/lassekongo83/stilo-themes"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
makedepends=('git' 'meson' 'sassc')
optdepends=('ttf-roboto: The recommended font')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/lassekongo83/stilo-themes')
sha256sums=('SKIP')

pkgver() {
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	meson --prefix /usr build
	ninja -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir" ninja -C build install
}
