# Maintainer: DIma Marhitych <uzhdimka@gmail.com>

pkgname=i3-rounded-border-patch
pkgver=4.23
pkgrel=2
pkgdesc='An improved dynamic tiling window manager, with a patch for rounded borders'
arch=('i686' 'x86_64')
url='http://i3wm.org/'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm' 'i3-gaps' 'i3-gaps-next-git')
groups=('i3' 'i3-vcs')
depends=('xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
	'startup-notification' 'pango' 'perl' 'xcb-util-cursor' 'xcb-util-xrm'
	'libxkbcommon-x11')
makedepends=('git' 'bison' 'flex' 'asciidoc' 'xmlto' 'meson')
optdepends=('i3lock: For locking your screen.'
	'i3status: To display system information with a bar.')
options=('docs')
source=('git+https://github.com/dimkauzh/i3#branch=stable')
sha1sums=('SKIP')

build() {
	cd "i3"
	arch-meson \
		-Ddocs=true \
		-Dmans=true \
		../build
	meson compile -C ../build
}

package() {
	cd "i3"
	DESTDIR="${pkgdir}" meson install -C ../build

	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}

# vim:set ts=2 sw=2 et:
