# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>
pkgname=gnabel-git
pkgver=r95.2eb9c5f
pkgrel=1
pkgdesc="A translation app for GTK environments based on Google Translate"
arch=('any')
url="https://github.com/gi-lom/gnabel"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'python-googletrans' 'python-gtts' 'python-pydub')
makedepends=('meson' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/gi-lom/gnabel.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "${pkgname%-git}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
