# Maintainer: somini <dev@somini.xyz>
_pkgname=xdg-autostart
pkgname="${_pkgname}-hg"
pkgver=latest
pkgrel=2
pkgdesc="Autostart programs according to the XDG specification"
arch=('x86_64')
url="https://bitbucket.org/fabriceT/xdg-autostart/overview"
license=('GPL3')
makedepends=('mercurial' 'vala' 'meson')
provides=('xdg-autostart')
conflicts=('xdg-autostart')
source=('hg+https://bitbucket.org/fabriceT/xdg-autostart')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd "$srcdir/$_pkgname"
	arch-meson build
	ninja -C build
}
package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 build/xdg-autostart -t "$pkgdir/usr/bin/"
}
