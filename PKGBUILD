# Maintainer: Yossef Sabry <yossefsabry66@gmail.com>
pkgname=keypop
pkgver=v1.0.r1.gfb0e782
pkgrel=1
pkgdesc="A simple Wayland key display application overlay"
arch=('x86_64')
url="https://github.com/yossefsabry/keypop"
license=('MIT')
depends=('wayland' 'cairo' 'pango' 'libinput' 'libxkbcommon' 'gtk3' 'libappindicator-gtk3')
makedepends=('git' 'wayland-protocols')
provides=('keypop')
conflicts=('keypop')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/keypop"
	git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/keypop"
	make
}

package() {
	cd "$srcdir/keypop"
	# Manual install since Makefile doesn't support DESTDIR/prefix correctly yet
	install -D -m755 keypop "$pkgdir/usr/bin/keypop"
	install -D -m644 readme.md "$pkgdir/usr/share/doc/keypop/readme.md"
    
    # Install license
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/keypop/LICENSE"
}
