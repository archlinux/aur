# Contributor: Stefano "GeniE" Faraone <xgotux@gmail.com>
# Maintainer: Markus Heidelberg <markus dot heidelberg at web dot de>

pkgname=njam
pkgver=1.25
pkgrel=7
pkgdesc="Full-featured cross-platform pacman-like game"
url="http://njam.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sdl_image' 'sdl_mixer' 'sdl_net')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tar.gz njam.desktop njam-1.25-gcc45-archlinux.patch)
md5sums=('b49f65a0c5df83de85df4f985337e2eb' 'a2e8f7e419de1b864c31342003ebcd4d' '0add7095857fe517d35abdbd79e25259')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}-src
	patch -p0 < ${srcdir}/njam-1.25-gcc45-archlinux.patch
  	./configure --prefix=/usr
	make clean || return 1 # Delete the binary files which are distributed in the tar file
  	make || return 1
  	make DESTDIR=${pkgdir} install
	install -Dm644 njamicon.ico ${pkgdir}/usr/share/pixmaps/njamicon.ico
	install -Dm644 ${srcdir}/njam.desktop ${pkgdir}/usr/share/applications/njam.desktop
}
