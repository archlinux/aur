# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Laurie Clark-Michalek <bluepepper@archlinux.us>
# Maintainer: 4javier <4javiereg4_at@_gmail_dot._com>
pkgname=simpleburn
pkgver=1.8.1
pkgrel=1
pkgdesc="A simple GTK+ application for burning CDs and DVDs"
arch=('i686' 'x86_64')
url="http://simpleburn.tuxfamily.org/"
license=('CeCILL')
depends=('cdrtools' 'gtk3' 'libdvdread' 'libcddb' 'libcdio')
makedepends=('cmake>=2.6' 'pkgconfig')
optdepends=('mpg123: needed for burning audio CD from MP3 encoded files'
			'lame: needed for cd audio extraction to mp3'
			'vorbis-tools: needed for burning audio CD from Vorbis encoded files'
			'mpg321: alternative to mpg123'
			'gmplayer: needed for video and audio preview'
			'mencoder: needed for video DVD extraction')
source=(http://simpleburn.tuxfamily.org/IMG/gz/$pkgname-$pkgver.tar.gz )
md5sums=('11cf5b9a69fda6c72b1ae1277fafa386')


build() {
	cd $pkgname-$pkgver
	cmake . -DCMAKE_INSTALL_PREFIX=/usr\
	#-DGTK2=ON
	# uncomment last line above and strip 'gtk3' from depends array if you want to build against gtk2 
	make || return 1
}
package() {
	cd $pkgname-$pkgver
		
	make DESTDIR="$pkgdir" install

	mv -f "$pkgdir"/usr/doc "$pkgdir"/usr/share/

	install -Dm644 $srcdir/$pkgname-$pkgver/doc/LICENSE\
	"$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
