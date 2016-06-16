# Maintainer: Brandon Mulcahy <brandon@jangler.info>
pkgname=schismtracker-git
pkgver=r2438.55398fa
pkgrel=1
pkgdesc='A reimplementation of the Impulse Tracker music editor.'
arch=('i686' 'x86_64' 'armv7h')  # and probably other ARMs
url='http://schismtracker.org/'
license=('GPL')
depends=('sdl' 'gcc-libs' 'libxv')
makedepends=('git')
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
	install -Dm644 icons/schism-icon-128.png \
		"$pkgdir/usr/share/icons/schism-icon-128.png"
	install -Dm644 icons/schism-itf-icon-128.png \
		"$pkgdir/usr/share/icons/schism-itf-icon-128.png"
	install -Dm644 sys/fd.org/schism.desktop \
		"$pkgdir/usr/share/applications/schism.desktop"
	install -Dm644 sys/fd.org/itf.desktop \
		"$pkgdir/usr/share/applications/itf.desktop"
	install -Dm644 README.md \
		"$pkgdir/usr/share/doc/schismtracker/README.md"
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/schismtracker/COPYING"
}
