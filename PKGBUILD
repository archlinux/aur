# Maintainer: Tercio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Brandon Mulcahy <brandon@jangler.info>

pkgname=schismtracker
pkgver=20180513
pkgrel=2
pkgdesc='A reimplementation of the Impulse Tracker music editor.'
arch=('i686' 'x86_64' 'armv7h')  # and probably other ARMs
url='http://schismtracker.org/'
license=('GPL')
depends=('sdl' 'gcc-libs' 'libxv')
makedepends=('git' 'python')
conflicts=('schismtracker-git')
source=("$pkgname::git+https://github.com/schismtracker/schismtracker.git#tag=$pkgver")
md5sums=('SKIP')

prepare () {
	# Correcting the file "schism.desktop"
	cd $srcdir/$pkgname/sys/fd.org
	sed -i 's/Audio;/AudioVideo;Audio;/' schism.desktop
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
