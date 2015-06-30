# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Michal Minar <mr.mini@centrum.cz>
# Contributor: Zsolt Udvari <udvzsolt@gmail.com>

_pkgname=oocairo
pkgname=lua-$_pkgname-git
pkgver=2015.04.03.g2f41d09
pkgrel=2
pkgdesc="Module providing access to Cairo from within Lua"
arch=(i686 x86_64)
url="https://github.com/awesomeWM/oocairo"
license=('MIT')
depends=("cairo>=1.8.0" "lua>=5.1")
conflicts=("lua-oocairo")
provides=("lua-oocairo")
makedepends=("git" "libtool" "pkgconfig")
source=("git+https://github.com/awesomeWM/oocairo.git")
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
	cd ${srcdir}/${_pkgname}
	autoreconf --install
	./configure --prefix=/usr
	make || return 1
}

package() {
	cd ${srcdir}/${_pkgname}
	make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir/usr/share/licenses/lua-$_pkgname"
	cp COPYRIGHT "$pkgdir/usr/share/licenses/lua-$_pkgname"
}
