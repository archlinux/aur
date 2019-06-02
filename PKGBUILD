# Maintainer: Jakub Kądziołka <kuba@kadziolka.net>

pkgname=dazzlie-git
pkgver=36.4199ba0
pkgrel=1
pkgdesc="a command-line program that lets you convert between various retro tile graphics formats and PNG"
arch=(x86_64)
url="https://github.com/obskyr/dazzlie"
license=(MIT)
depends=(gc pcre libevent)
makedepends=(crystal shards git)
source=(git+ssh://git@github.com/obskyr/dazzlie.git)
sha1sums=(SKIP)

pkgver(){
	cd dazzlie
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare(){
	sed -i 's/crystal deps/shards/;s/crystal build/\0 --link-flags $(LDFLAGS)/' dazzlie/Makefile
}

build(){
	cd dazzlie
	make
}

package(){
	cd dazzlie
	install -Dm755 bin/dazzlie "$pkgdir/usr/bin/dazzlie"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/dazzlie-git/LICENSE"
}
