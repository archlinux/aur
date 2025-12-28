# Maintainer: Nici
_pkgname=bibata_cursor_gruvbox
pkgname=bibata-cursor-gruvbox-git
pkgver=1.0.0.r0.f4ccfe8
pkgrel=1
pkgdesc='Gruvbox Bibata Cursor Themes, including hyprcursor and Xcursor'
arch=('any')
url="https://github.com/NiciTheNici/${_pkgname}"
license=('GPL-3.0-or-later')
makedepends=('git' 'librsvg' 'python' 'xorg-xcursorgen')
options=('!strip')
source=("git+https://github.com/NiciTheNici/${_pkgname}.git")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${_pkgname}
	./src/cursor_utils.py --hypr --x11 --x11-symlink adwaita --theme Bibata-Modern-Classic-Gruvbox --out-dir out
	./src/cursor_utils.py --hypr --x11 --x11-symlink adwaita --theme Bibata-Modern-Classic-Gruvbox-Right --out-dir out_right
}

package() {
	cd ${_pkgname}
	install -d "$pkgdir/usr/share/icons"
	cp -r out/Bibata-* "$pkgdir/usr/share/icons/"
	cp -r out_right/Bibata-* "$pkgdir/usr/share/icons/"
}
