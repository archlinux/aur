# Maintainer: Alexandre Iooss <alexandre.iooss@gmail.com>

pkgname=bebop_mavlink_ctrl-git
pkgver=r4.b0c6b78
pkgrel=2
pkgdesc="Control the Parrot drone using xbox controller with mavlink"
arch=(x86_64)
url="http://developer.parrot.com/"
license=('custom')
groups=()
depends=()
optdepends=()
makedepends=(git python2-pymavlink-git)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('bebop_mavlink_ctrl::git+https://github.com/Parrot-Developers/bebop_mavlink_ctrl'
        'LICENSE')
sha256sums=('SKIP'
            '1771e95329e9cb2bed04e023e330af3d558d0f13c0c1c5de0581f2880f149deb')

pkgver() {
	cd "$srcdir/bebop_mavlink_ctrl"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/bebop_mavlink_ctrl"
	mavgen.py --lang C -o out/ /usr/lib/python2.7/site-packages/pymavlink/dialects/v10/common.xml
	make all tests
}

package() {
	# Copy files
	mkdir -p "$pkgdir/usr/lib/"
	mkdir -p "$pkgdir/usr/bin/"
	cp "$srcdir/bebop_mavlink_ctrl/out/libmavlink.so" "$pkgdir/usr/lib/"
	cp "$srcdir/bebop_mavlink_ctrl/out/test_drone" "$pkgdir/usr/bin/"
	cp "$srcdir/bebop_mavlink_ctrl/out/test_gcs" "$pkgdir/usr/bin/"

	# Install license
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
