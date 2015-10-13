# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Michal Minar <mr.mini@centrum.cz>
# Contributor: Zsolt Udvari <udvzsolt@gmail.com>

_pkgname=oocairo
pkgname=lua51-$_pkgname-git
pkgver=2015.07.14.gc0b15cd
pkgrel=1
pkgdesc="Module providing access to Cairo from within Lua"
arch=("i686" "x86_64")
url="https://github.com/awesomeWM/$_pkgname"
license=("MIT")
depends=("cairo>=1.8.0" "lua51")
conflicts=("lua51-oocairo")
provides=("lua51-oocairo")
makedepends=("git" "libtool" "pkgconfig")
source=("git+https://github.com/awesomeWM/$_pkgname.git")
sha1sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	autoreconf --install
	export oocairo_cv_lua_name=lua5.1
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 .libs/liboocairo.so.0.0.0 "$pkgdir/usr/lib/lua/5.1/oocairo.so"
	install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/lua51-$_pkgname/COPYRIGHT"
}
