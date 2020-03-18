# Maintainer: revel <revelΘmuub·net>
# Contributor: Stephen Caraher <moskvax@gmail.com>
# Contributor: Uli Armbruster <uli_armbrusterΘweb·de>
# Contributor: Robert Gregor <gimpΘpop·de>

pkgname=libvorbis-aotuv
pkgver=b6.03.2018
pkgrel=2
_srcrel=beta6.03-2018
pkgdesc="aoTuV is software library for encoding and decoding of OggVorbis that modified encoding part of Xiph.Org's libvorbis."
arch=('i686' 'x86_64')
url='https://ao-yumi.github.io/aotuv_web/'
license=('BSD')
depends=('libogg')
conflicts=('libvorbis')
provides=('libvorbis=1.3.6' 'libvorbisfile.so' 'libvorbis.so' 'libvorbisenc.so')
source=("https://github.com/AO-Yumi/vorbis_aotuv/archive/${_srcrel}.tar.gz")
md5sums=('ed5130f9f3196f0dd0a6e50bc3c27586')
sha256sums=('abbb526b241442d66ab4226a2beea39a0d61a57e2b05aca98cb7e823585d8ba2')

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
