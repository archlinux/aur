# Maintainer: RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Mathias Buhr <napcode@apparatus.de>

pkgname=tony
pkgver=2.1.1
pkgrel=8
pkgdesc="High quality pitch and note transcription for scientific applications"
arch=('x86_64')
url="https://github.com/sonic-visualiser/tony"
license=('GPL2')
source=(
	"${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
	'compilation_fixes.patch'
)
depends=(
	'jack'
	'libfishsound'
	'libid3tag'
	'liblo'
	'liblrdf'
	'libmad'
	'liboggz'
	'libpulse'
	'opusfile'
	'portaudio'
	'qt5-svg'
	'rubberband'
	'serd'
	'sord'
	'hicolor-icon-theme'
)
makedepends=('boost')
sha256sums=('d79d85be738b00aef7859473f2c0385632d6cb30cd3752e07e952220695de20d'
            'b5b1105e1cd00b31da1264b301d37898b46585f8885c2d1bd3d76c6d38365897')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p2 -i ../../compilation_fixes.patch
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export INSTALL_ROOT="${pkgdir}/"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	export INSTALL_ROOT="${pkgdir}/"
	make install
}
