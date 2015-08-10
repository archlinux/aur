# Maintainer: revel <revelΘmuub·net>
# Contributor: Stephen Caraher <moskvax@gmail.com>
# Contributor: Uli Armbruster <uli_armbrusterΘweb·de>
# Contributor: Robert Gregor <gimpΘpop·de>

pkgname=libvorbis-aotuv
pkgver=b6.03
pkgrel=6
_releasedate=20110424-20150808
_srcrel=2015
pkgdesc='A fork of libvorbis intended to provide better quality sound at low to medium bitrates.'
arch=('i686' 'x86_64')
url='http://www.geocities.jp/aoyoume/aotuv'
license=('BSD')
depends=('libogg')
conflicts=('libvorbis')
provides=('libvorbis=1.3.5' 'libvorbisfile.so' 'libvorbis.so' 'libvorbisenc.so')
source=("http://www.geocities.jp/aoyoume/aotuv/source_code/${pkgname}_${pkgver}_${_srcrel}.tar.bz2")
md5sums=('6eaebfbe8817ceda7ff5a7ef462e7a91')
sha256sums=('fba6724d2bc2b6a911a25e60f21a45749d507f181a9e150415ce41e4d03bc08f')

prepare() {
	cd "aotuv-${pkgver}_${_releasedate}"
	chmod +x configure
}

build() {
	cd "aotuv-${pkgver}_${_releasedate}"
	./configure --prefix=/usr --disable-static
	make
}

check() {
	cd "aotuv-${pkgver}_${_releasedate}"
	make -j1 check
}

package() {
	cd "aotuv-${pkgver}_${_releasedate}"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
