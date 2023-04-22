# Developed by:   https://github.com/icculus
# Maintainer:  John N Bilbrey (beelzebud) <beelzebud@gmail.com>

_pkgname=dirksimple
pkgname=$_pkgname-git
pkgver=r185.aee535b
pkgrel=1
pkgdesc="This is a dirt-simple FMV/laserdisc game player."
arch=('x86_64')
url="https://github.com/icculus/DirkSimple"
license=('zlib')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'libvorbis')
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
	install -d "$pkgdir"/usr/share/games/"$_pkgname"/data
	install -m644 "$srcdir/$_pkgname/$pkgname"/data/*.* "$pkgdir"/usr/share/games/"$_pkgname"/data/
	install -Dm644 "$srcdir/$_pkgname"/LICENSE.txt "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE.txt
	install -d "$pkgdir"/usr/share/doc/"$_pkgname"/
	install -m644 "$srcdir/$_pkgname"/README.md "$pkgdir"/usr/share/doc/"$_pkgname"/
}
