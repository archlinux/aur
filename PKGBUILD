# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>
pkgname=dialect-git
pkgver=1.0.0.r0.g3d5c084
pkgrel=1
pkgdesc="A translation app for GTK environments based on Google Translate"
arch=('any')
url="https://github.com/gi-lom/dialect"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'python-googletrans' 'python-gtts' 'python-pydub')
makedepends=('meson' 'git' 'gobject-introspection')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'gnabel')
replaces=('gnabel-git')
source=('git+https://github.com/gi-lom/dialect.git#branch=main')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson "${pkgname%-git}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
