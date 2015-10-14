# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Michal Minar <mr.mini@centrum.cz>
# Contributor: Zsolt Udvari <udvzsolt@gmail.com>

_pkgname=oocairo
pkgname=lua-$_pkgname-git
pkgver=2015.07.14.gc0b15cd
pkgrel=1
pkgdesc="Module providing access to Cairo from within Lua"
arch=("i686" "x86_64")
url="https://github.com/awesomeWM/$_pkgname"
license=("MIT")
depends=("cairo>=1.8.0" "lua>=5.1")
makedepends=("git" "libtool" "pkgconfig")
provides=("lua-oocairo")
conflicts=("lua-oocairo")
source=("git+https://github.com/awesomeWM/$_pkgname.git")
sha1sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	autoreconf --install
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/lua-$_pkgname/COPYRIGHT"
}
