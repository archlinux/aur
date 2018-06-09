# Maintainer: Brandon Mulcahy <brandon@jangler.info>
pkgname=schismtracker-git
pkgver=r2438.55398fa
pkgrel=4
pkgdesc='A reimplementation of the Impulse Tracker music editor.'
arch=('i686' 'x86_64' 'armv7h')  # and probably other ARMs
url='http://schismtracker.org/'
license=('GPL')
depends=('sdl' 'gcc-libs' 'libxv')
makedepends=('git' 'python')
provides=('schismtracker' 'schismtracker-hg' 'schismtracker-cvs')
conflicts=('schismtracker' 'schismtracker-hg' 'schismtracker-cvs')
source=("$pkgname::git+https://github.com/schismtracker/schismtracker.git")
md5sums=('SKIP')

pkgver() {
	cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd $pkgname
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir/" install
	install -Dm644 README.md \
		"$pkgdir/usr/share/doc/schismtracker/README.md"
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/schismtracker/COPYING"
}
