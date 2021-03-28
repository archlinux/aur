# Maintainer: revel <revelΘmuub·net>
# Contributor: Stephen Caraher <moskvax@gmail.com>
# Contributor: Uli Armbruster <uli_armbrusterΘweb·de>
# Contributor: Robert Gregor <gimpΘpop·de>

pkgname=libvorbis-aotuv
pkgver=b6.03.2020
pkgrel=1
_srcrel=beta6.03-2020
pkgdesc="aoTuV is software library for encoding and decoding of OggVorbis that modified encoding part of Xiph.Org's libvorbis."
arch=('i686' 'x86_64')
url='https://ao-yumi.github.io/aotuv_web/'
license=('BSD')
depends=('libogg')
conflicts=('libvorbis')
provides=('libvorbis=1.3.7' 'libvorbisfile.so' 'libvorbis.so' 'libvorbisenc.so')
source=("https://github.com/AO-Yumi/vorbis_aotuv/archive/refs/tags/${_srcrel}.tar.gz")
md5sums=('b29430001a52ea4784fc942961b81c3b')
sha256sums=('b529eb656a28cdd3a3ce22fe470a2f7705a088a87ccabe6675f1748e843aef0d')

prepare() {
	cd "vorbis_aotuv-${_srcrel}"
	chmod +x configure
}

build() {
	cd "vorbis_aotuv-${_srcrel}"
	./configure --prefix=/usr --disable-static
	make
}

check() {
	cd "vorbis_aotuv-${_srcrel}"
	make -j1 check
}

package() {
	cd "vorbis_aotuv-${_srcrel}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
