# Contributor: Nathaniel Maia <natemaia10@gmail.com>
# Maintainer: Stefan Husmann < stefan-husmann@t-online.de>

pkgname=dk-git
pkgver=1.9.r1.g3c1f321
pkgrel=1
epoch=1
pkgdesc="A tiling window manager in the vein of dwm, bspwm, and xmonad - git checkout"
url="https://bitbucket.org/natemaia/dk"
arch=('x86_64')
license=('MIT')
source=("git+${url}.git")
conflicts=('dk')
provides=('dk')
sha256sums=('SKIP')
optdepends=(
		'sxhkd: keybind support [recommended]'
		'st: example rc files default terminal'
		'dmenu: example rc files default launcher'
		)
makedepends=('git')
depends=('xcb-proto' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms' 'xcb-util-cursor')
install=dk.install

pkgver() {
  cd dk
  git describe --tags |sed 's+-+.r+'|tr - .|cut -c2-
}

package()
{
	cd dk/ &&
		make DESTDIR="$pkgdir" PREFIX="/usr" install &&
		install -D -m644 LICENSE $pkgdir/usr/share/licenses/dk/LICENSE
}
