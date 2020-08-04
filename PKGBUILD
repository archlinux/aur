# Maintainer: William Brown <glowinthedarkcia@horsefucker.org>
pkgname="particle-life-git"
pkgver="5"
pkgrel="1"
arch=("x86_64")
pkgdesc="A game of life with particles."
url="https://github.com/HackerPoet/Particle-Life#readme"
source=("git+https://github.com/HackerPoet/Particle-Life.git")
md5sums=("SKIP")
license=("MIT")
depends=("sfml")
makedepends=("git")
pkgver() {
	cd "$srcdir/Particle-Life"
	git rev-list --count HEAD
}
build() {
	cd "$srcdir/Particle-Life"
	# Uses GNU-specific features. Using g++ instead of c++.
	g++ -o particle-life -lsfml-graphics -lsfml-window -lsfml-system \
		HSV.h Main.cpp Particles.h Universe.cpp Universe.h
}
package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/licenses/particle-life-git"
	cd "$srcdir/Particle-Life"
	cp LICENSE "$pkgdir/usr/share/licenses/particle-life-git"
	cp particle-life "$pkgdir/usr/bin"
}
