# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Laurie Clark-Michalek <bluepepper@archlinux.us>
# Contributor: Frank Endres <frankendres@tuxfamily.org>
# Maintainer: 4javier <4javiereg4_at@_gmail_dot._com>
pkgname=simpleburn
pkgver=1.8.2
pkgrel=1
pkgdesc="A simple GTK+ application for burning CDs and DVDs"
arch=('i686' 'x86_64')
url="http://simpleburn.tuxfamily.org/"
license=('CeCILL')
depends=('cdrtools' 'gtk3' 'libdvdread' 'libcddb' 'libcdio')
makedepends=('cmake>=2.8' 'pkgconfig')
optdepends=('mpg123: needed for burning audio CD from MP3 encoded files (or mpg321)'
			'vorbis-tools: needed for burning audio CD from Vorbis encoded files'
			'lame: needed for cd audio extraction to mp3'
			'gnome-mplayer: needed for video and audio preview (or smplayer)'
			'mencoder: needed for video DVD extraction')
source=(http://simpleburn.tuxfamily.org/IMG/gz/$pkgname-$pkgver.tar.gz )
md5sums=('9df96114ff3eb71ad3b9f16eb6848f3a')


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
	install -Dm644 $srcdir/$pkgname-$pkgver/doc/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
