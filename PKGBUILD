# Maintainer: Yossef Sabry <yossefsabry66@gmail.com>
pkgname=csong-git
pkgver=r44.a883915
pkgrel=1
pkgdesc="Lyrics viewer for MPD/ncmpcpp with terminal, X11, and Wayland backends"
arch=('x86_64')
url="https://github.com/yossefsabry/csong"
license=('MIT')
depends=('libmpdclient' 'curl' 'fribidi' 'dbus' 'libx11' 'libxft' 'libxfixes' 'libxrender' 'libxext' 'fontconfig' 'freetype2' 'wayland' 'pango' 'cairo')
makedepends=('git')
provides=('csong')
conflicts=('csong')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/csong"
	git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/csong"
	make
}

package() {
	cd "$srcdir/csong"
	install -D -m755 csong "$pkgdir/usr/bin/csong"
	install -D -m644 README.md "$pkgdir/usr/share/doc/csong/README.md"
	install -D -m644 config/sample.toml "$pkgdir/usr/share/doc/csong/sample.toml"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/csong/LICENSE"
}
