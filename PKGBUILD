# Maintainer: silverhikar <kerrickethan@gmail.com>
pkgname=unzip-jp-gui-git
pkgver=1.0.0.r4.d082e31
epoch=2
pkgrel=1
pkgdesc="unzip SHIFT-JIS encoded zip archives"
arch=('any')
url="https://github.com/saberzero1/unzip-jp-gui"
license=('MIT')
depends=('python' "tk")
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/saberzero1/unzip-jp-gui' 'cli.patch')
sha256sums=('SKIP' '5184f21e1bd66ed70d98181b97a397932a8418a285dfe9600dfc129f698b0b9e')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/cli.patch"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	sed -i "1i#!/usr/bin/env python3\n" "./archive_gui.py"
	install -Dm755 "archive_gui.py" "$pkgdir/usr/bin/unzip-jp-gui"
	install -Dm755 "unzip-jp" "$pkgdir/usr/bin/unzip-jp"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/unzip-jp-gui-git/LICENSE"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/unzip-jp-gui/README.md"
}
