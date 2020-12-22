# Maintainer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)
pkgname=droidcam-obs-plugin-git
pkgver=1.1.r5.b8febd6
pkgrel=1
pkgdesc="plugin for droidcam obs"
arch=(x86_64)
url="https://dev47apps.com/obs/"
srcurl="https://github.com/dev47apps/droidcam-obs-plugin.git"
license=('GPL')
groups=()
depends=(obs-studio)
makedepends=('git' 'libjpeg-turbo' 'libusbmuxd')
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
pkgstem=${pkgname%-git}
source=("${pkgstem}::git+${srcurl}"
	fix_Makefile.patch)
noextract=()
sha256sums=('SKIP'
            '5a52749268fafe141eecbb63f0dea10ac1a100e1b1ba63a2f1cf574837b8c069')

pkgver() {
	cd "$srcdir/$pkgstem"
	printf "%s" "$(git describe --tags --long | \
	       sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/$pkgstem"
	patch -p1 -i "$srcdir/fix_Makefile.patch"
	mkdir -p build
}

build() {
	cd "$srcdir/$pkgstem"
	make
}

package() {
	mkdir -p "$pkgdir/usr/lib/obs-plugins"
	cp "$srcdir/$pkgstem/build/droidcam-obs.so" \
	   "$pkgdir/usr/lib/obs-plugins/"
	mkdir -p "$pkgdir/usr/share/obs/obs-plugins/droidcam-obs"
	cp -r "$srcdir/$pkgstem/data/locale" \
	   "$pkgdir/usr/share/obs/obs-plugins/droidcam-obs/"
}
