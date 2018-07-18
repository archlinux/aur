# Maintainer: Jean-Baptiste Mazon <jmazon plus arch at gmail dot com>
pkgname=obs-gnome-screencast-git
pkgver=v0.0.9.r1.0e7ab88
pkgrel=1
pkgdesc="GNOME Screen Cast OBS Studio plugin"
arch=(x86_64)
url="git+https://github.com/fzwoch/obs-gnome-screencast"
license=('GPL')
groups=()
depends=('obs-studio' 'glib2' 'gstreamer' 'gtk3' 'gnome-shell')
makedepends=('git' 'meson' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("$url")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags |
	               sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	meson --buildtype=release --prefix /usr build
	ninja -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR=$pkgdir ninja -C build install
}
