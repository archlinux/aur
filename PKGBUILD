# Maintainer: Pulshen Sudokamikaze <pulshencode@outlook.com>

pkgname=lib32-alsaequal
_srcname=alsaequal
pkgver=0.6
pkgrel=16
pkgdesc="A real-time adjustable equalizer plugin for ALSA sound server."
arch=('x86_64')
url="http://www.thedigitalmachine.net/alsaequal.html"
license=('GPL2')
depends=('lib32-alsa-lib' 'lib32-caps')
optdepends=('lib32-swh-plugins: to use the mbeq equalizer (15-band)')
install='alsaequal.install'

source=("https://launchpad.net/ubuntu/+archive/primary/+files/alsaequal_${pkgver}.orig.tar.bz2"
        'false_error.patch'
	     	'alsaequal.patch'
        '0001-fix-lib32-makefile.patch'
        '0002-fix-lib32-makefile.patch'
	    	'lib32-alsaequal_caps_9.x.patch'
        'alsaequal-asneeded.patch')

sha256sums=('916e7d152added24617efc350142438a46099efe062bd8781d36dbf10b4e6ff0'
            'c1a02bfed6be6385e8ab4ebe7c9c3844e9c0937fbafe0f8d948842c2b7c9f7f0'
            '2f3d928b0c0665c39ace25fd727bd12b6e81b2406811bd0744c09f804b6d25bd'
            'd8b2f37f39a29de73feed8aedfb917fb621338dfeb8096ed0f01faf5e873c0b4'
            '53a067babe50333138c39549db937aa0746aad39f849f70a5196fa05d2d18867'
            'd8d12c72176e1f7aba9443007f72a7ab7bb8f8d677757db24630dc593eaf978c'
            '24718bedfa184b9a59127020f09105cc831b5f188be4b05f21b530bf13155a52')


prepare() {
	cd "$srcdir/${_srcname}"
	patch -Np0 -i ../false_error.patch
	patch -Np0 -i ../alsaequal.patch
	patch -Np1 -i ../0001-fix-lib32-makefile.patch
  patch -Np1 -i ../0002-fix-lib32-makefile.patch
	patch -Np0 -i ../lib32-alsaequal_caps_9.x.patch
  patch -Np0 -i ../alsaequal-asneeded.patch
	make clean
}

build() {
	cd "${srcdir}/${_srcname}"
	make
}

package() {
  cd "${srcdir}/${_srcname}"
  install -dm755 "$pkgdir"/usr/lib32/alsa-lib
  make DESTDIR="$pkgdir" install
}
