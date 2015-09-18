# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Corey Mwamba <contact.me@coreymwamba.co.uk>
pkgname=rt_pvc
pkgver=1.0.0
pkgrel=1
pkgdesc="real-time phase vocoder"
arch=('i686' 'x86_64')
url="http://soundlab.cs.princeton.edu/software/rt_pvc/"
license=('GPL')
groups=('multimedia')
depends=('alsa-lib' 'glu' 'freeglut' 'libxmu')
provides=('rt_pvc')
source=("http://soundlab.cs.princeton.edu/software/$pkgname/$pkgname-$pkgver.tgz" "RtAudio.patch" "alsa.patch" "pvc.patch")
md5sums=('0a99b4f17038dd76c172735dbf7f2d15'
         '8cdab915ec05f8fe8b256305f8803b78'
         '1880c9f919b92ee95d7a8ea3e2e2b905'
         '6340e9c2a16ba0ff311457e5c0eb81f3')

prepare() {
	cd "$srcdir"
	patch -i "RtAudio.patch"
	patch -i "alsa.patch"
	patch -i "pvc.patch"
}

build() {
	cd "$srcdir"
	make -f makefile.alsa
}

package() {
	cd "$pkgdir"
	mkdir -p /usr/bin
	cd "$srcdir"
	install -p -D $pkgname -m 0755 $pkgdir/usr/bin/$pkgname
}
