_pkgname=bibata_cursor
pkgname=bibata-cursor-git
pkgver=1.0.0.r0.f4ccfe8
pkgrel=1
pkgdesc='Bibata Cursor Themes, including hyprcursor and Xcursor'
arch=('any')
url="https://github.com/rtgiskard/${_pkgname}"
license=('GPL-3.0-or-later')
conflicts=('bibata-cursor-theme')
makedepends=('git' 'librsvg' 'python' 'xorg-xcursorgen')
options=('!strip')
source=("git+https://github.com/rtgiskard/${_pkgname}.git")
b2sums=('SKIP')

pkgver() {
	git -C ${_pkgname} describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd ${_pkgname}
	./src/cursor_utils.py --hypr --x11 --x11-symlink adwaita --out-dir out
}

package() {
	cd ${_pkgname}
	install -d "$pkgdir/usr/share/icons"
	cp -r out/Bibata-* "$pkgdir/usr/share/icons/"
}
