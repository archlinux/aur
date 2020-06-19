pkgname=turtlico-git
pkgver=0.3.0
pkgrel=2
pkgdesc="The easy programming tool"
arch=('any')
url="https://turtlico.gitlab.com/"
license=('GPL3')
makedepends=('libgee' 'gtk3' 'gtksourceview4' 'json-glib' 'meson' 'vala')
depends=('python' 'tk' 'noto-fonts-emoji')
optdepends=('python-gpiozero: Raspberry PI Plugin'
	    'gstreamer: Multimedia plugin')
source=('git+https://gitlab.com/turtlico/turtlico.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
	arch-meson "${pkgname%-git}" build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
