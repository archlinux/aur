# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=libnsfb-git
_pkgname=libnsfb
pkgver=r150.d5b4c96
pkgrel=1
pkgdesc="Framebuffer abstraction library (git version)"
arch=('any')
url="https://www.netsurf-browser.org/projects/$_pkgname/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'netsurf-buildsystem')
conflicts=('libnsfb')
provides=('libnsfb')
source=("git://git.netsurf-browser.org/$_pkgname.git")
sha512sums=(SKIP)
_makeopts="-C $_pkgname PREFIX=/usr COMPONENT_TYPE=lib-shared"

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	make $_makeopts
}

check() {
	make $_makeopts test
}

package() {
	local installopts='--mode 0644 -D --target-directory'
	local shrdir="$pkgdir/usr/share"
	local licdir="$shrdir/licenses/$pkgname"
	local docdir="$shrdir/doc/$pkgname"
	install $installopts "$licdir" $_pkgname/COPYING
	install $installopts "$docdir" $_pkgname/{README,usage}
	make $_makeopts DESTDIR="$pkgdir" install
}
