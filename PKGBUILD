# Developed by:   https://github.com/icculus
# Maintainer:  John N Bilbrey (beelzebud) <beelzebud@gmail.com>

_pkgname=dirksimple
pkgname=$_pkgname-git
pkgver=r208.9c370ef
pkgrel=1
pkgdesc="This is a dirt-simple FMV/laserdisc game player."
arch=('x86_64')
url="https://github.com/icculus/DirkSimple"
license=('zlib')
depends=('sdl2' 'glibc' 'perl')
makedepends=('git' 'cmake')
provides=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
	cd $_pkgname
	cmake -B "$pkgname"
	cmake --build "$pkgname"
}

package() {
	cd "$srcdir"
	install -d "$pkgdir"/usr/share/games/"$_pkgname"
	install -Dm755 "$srcdir/$_pkgname/$pkgname"/dirksimple "$pkgdir"/usr/share/games/"$_pkgname"/
	install -Dm644 "$srcdir/$_pkgname/$pkgname"/*.* "$pkgdir"/usr/share/games/"$_pkgname"/
	install -d "$pkgdir"/usr/share/games/"$_pkgname"/{data,data/games,data/games/lair,data/games/cliff}
	install -m644 "$srcdir/$_pkgname"/data/*.* "$pkgdir"/usr/share/games/"$_pkgname"/data/
	install -m644 "$srcdir/$_pkgname"/data/games/lair/*.* "$pkgdir"/usr/share/games/"$_pkgname"/data/games/lair/
	install -m644 "$srcdir/$_pkgname"/data/games/cliff/*.* "$pkgdir"/usr/share/games/"$_pkgname"/data/games/cliff/
	install -d "$pkgdir"/usr/share/games/"$_pkgname"/{misc,misc/disassembled_games}
	install -m644 "$srcdir/$_pkgname"/misc/*.* "$pkgdir"/usr/share/games/"$_pkgname"/misc/
	install -m644 "$srcdir/$_pkgname"/misc/disassembled_games/*.* "$pkgdir"/usr/share/games/"$_pkgname"/misc/disassembled_games/
	install -Dm644 "$srcdir/$_pkgname"/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
	install -d "$pkgdir"/usr/share/doc/"$_pkgname"/
	install -m644 "$srcdir/$_pkgname"/README.md "$pkgdir"/usr/share/doc/"$_pkgname"/
	install -d "$pkgdir"/usr/bin/
        ln -s "$pkgdir"/usr/share/games/"$_pkgname"/dirksimple "$pkgdir"/usr/bin/
}
