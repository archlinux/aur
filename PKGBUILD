# Maintainer: revel <revelΘmuub·net>
# Contributor: Stephen Caraher <moskvax@gmail.com>
# Contributor: Uli Armbruster <uli_armbrusterΘweb·de>
# Contributor: Robert Gregor <gimpΘpop·de>

pkgname=libvorbis-aotuv
pkgver=b6.03
pkgrel=5
_releasedate=20110424-20140429
_srcrel=2014
pkgdesc='A fork of libvorbis intended to provide better quality sound at low to medium bitrates.'
arch=('i686' 'x86_64')
url='http://www.geocities.jp/aoyoume/aotuv'
license=('BSD')
depends=('libogg')
conflicts=('libvorbis')
provides=('libvorbis=1.3.4' 'libvorbisfile.so' 'libvorbis.so' 'libvorbisenc.so')
source=("http://www.geocities.jp/aoyoume/aotuv/source_code/${pkgname}_${pkgver}_${_srcrel}.tar.bz2")
md5sums=('2645f282bf98720dfa972993559c2925')
sha256sums=('5c11bd73e947ab862818fe80db0ab5eaefdd4ac670bf185dd8e7a7c6ad76f2ad')

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
