# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Corey Mwamba <contact.me@coreymwamba.co.uk>
pkgname=rt_lpc-alsa
_pkgname=rt_lpc
pkgver=1.0
pkgrel=1
pkgdesc="real-time LPC analysis + synthesis + visualization: ALSA version"
arch=('i686' 'x86_64')
url="http://soundlab.cs.princeton.edu/software/rt_lpc/"
license=('GPL')
groups=('multimedia')
depends=('alsa-lib' 'glu' 'freeglut' 'libxmu')
provides=('rt_lpc-alsa')
source=("http://soundlab.cs.princeton.edu/software/$_pkgname/files/$_pkgname-$pkgver.tgz" "RtAudio.patch" "alsa.patch")
md5sums=('468aa24999dd02d8c8abd84c04e37274'
         '8cdab915ec05f8fe8b256305f8803b78'
         '1160feb623e80c0405e2b0c42fe967c5')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver/src"
	patch -i "$srcdir/RtAudio.patch"
	patch -i "$srcdir/alsa.patch"
}

build() {
	cd "$_pkgname-$pkgver/src"
	make linux-alsa
}

package() {
	cd "$pkgdir"
	mkdir -p /usr/bin
	cd "$srcdir/$_pkgname-$pkgver/src"
	install -p -D $_pkgname -m 0755 $pkgdir/usr/bin/$pkgname
}
