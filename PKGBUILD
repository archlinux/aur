# Maintainer : Greg Aluise <galuise@giantg.net>
# Contributer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)

pkgname=droidcam-obs-plugin-git
pkgver=2.4.2.r1.161cb95
pkgrel=1
pkgdesc="plugin for droidcam obs"
arch=('x86_64' 'i686')
url="https://dev47apps.com/obs/"
srcurl="https://github.com/dev47apps/droidcam-obs-plugin.git"
license=('GPL')
groups=()
depends=('obs-studio' 'libusbmuxd' 'libjpeg-turbo' 'libimobiledevice')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
pkgstem=${pkgname%-git}
source=("${pkgstem}::git+${srcurl}")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgstem"
	printf "%s" "$(git describe --tags --long | \
	       sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/$pkgstem"
	mkdir -p build
}

build() {
	cd "$srcdir/$pkgstem"
	make LIBUSBMUXD=libusbmuxd-2.0 LIBIMOBILEDEV=libimobiledevice-1.0 ALLOW_STATIC=no
}

package() {
	mkdir -p "$pkgdir/usr/lib/obs-plugins"
	cp "$srcdir/$pkgstem/build/droidcam-obs.so" \
	   "$pkgdir/usr/lib/obs-plugins/"
	mkdir -p "$pkgdir/usr/share/obs/obs-plugins/droidcam-obs"
	cp -r "$srcdir/$pkgstem/data/locale" \
	   "$pkgdir/usr/share/obs/obs-plugins/droidcam-obs/"
}
