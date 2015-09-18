# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=sndpeek-jack
_pkgname=sndpeek
pkgver=1.4
pkgrel=1
pkgdesc="a real-time audio visualization tool (animated, 3D): JACK version"
arch=('i686' 'x86_64')
url="http://soundlab.cs.princeton.edu/software/sndpeek/"
license=('GPL')
groups=('multimedia')
depends=('libsndfile' 'jack' 'glu' 'freeglut' 'libxmu')
provides=('sndpeek-jack')
source=("http://soundlab.cs.princeton.edu/software/$_pkgname/files/$_pkgname-$pkgver.tgz" "LPC.patch" "makefile.jack.patch")
md5sums=('91df9f339230fd6c01f85ebd4cca51cb' 'b73a667384ffa9237ded847483c796da' '11e10b877c866f5d6f2b7dcee061176b')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver/src/marsyas"
	patch -p2 -i "$srcdir/LPC.patch"
	cd "$srcdir/$_pkgname-$pkgver/src/$_pkgname"
	patch -i "$srcdir/makefile.jack.patch"
}

build() {
	cd "$_pkgname-$pkgver/src/$_pkgname"
	make linux-jack
}

package() {
	cd "$pkgdir"
	mkdir -p /usr/bin
	cd "$srcdir/$_pkgname-$pkgver/src/$_pkgname"
	install -p -D $_pkgname -m 0755 $pkgdir/usr/bin/$pkgname
}
