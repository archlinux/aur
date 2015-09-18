# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Corey Mwamba <contact.me@coreymwamba.co.uk>
pkgname=rt_lpc-jack
_pkgname=rt_lpc
pkgver=1.0
pkgrel=1
pkgdesc="real-time LPC analysis + synthesis + visualization: JACK version"
arch=('i686' 'x86_64')
url="http://soundlab.cs.princeton.edu/software/rt_lpc/"
license=('GPL')
groups=('multimedia')
depends=('jack' 'glu' 'freeglut' 'libxmu')
provides=('rt_lpc-alsa')
source=("http://soundlab.cs.princeton.edu/software/$_pkgname/files/$_pkgname-$pkgver.tgz" "RtAudio.patch" "jack.patch")
md5sums=('468aa24999dd02d8c8abd84c04e37274'
         '1d3031ebb04627f013e569b8e4cf019a'
         'f2a25f46220c7349fad03940da3694dd')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver/src"
	patch -i "$srcdir/RtAudio.patch"
	patch -i "$srcdir/jack.patch"
}

build() {
	cd "$_pkgname-$pkgver/src"
	make linux-jack
}

package() {
	cd "$pkgdir"
	mkdir -p /usr/bin
	cd "$srcdir/$_pkgname-$pkgver/src"
	install -p -D $_pkgname -m 0755 $pkgdir/usr/bin/$pkgname
}
