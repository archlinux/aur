# Maintainer: Sudokamikaze <sudokamikaze@protonmail.com>

pkgname=lib32-alsaequal
_srcname=alsaequal
pkgver=0.6
pkgrel=17
pkgdesc="A real-time adjustable equalizer plugin for ALSA sound server."
arch=('x86_64')
url="http://www.thedigitalmachine.net/alsaequal.html"
license=('GPL2')
depends=('lib32-alsa-lib' 'lib32-caps')
optdepends=('lib32-swh-plugins: to use the mbeq equalizer (15-band)')
install='alsaequal.install'

source=("https://launchpad.net/ubuntu/+archive/primary/+files/alsaequal_${pkgver}.orig.tar.bz2"
        'false_error.patch'
        'lib32_ctr.patch'
        'lib32_makefile.patch'
	    	'lib32-alsaequal_caps_9.x.patch'
        'ladspa_multilib.patch'
        '0003-use-alsaequal_bin.patch')

sha256sums=('916e7d152added24617efc350142438a46099efe062bd8781d36dbf10b4e6ff0'
            'c1a02bfed6be6385e8ab4ebe7c9c3844e9c0937fbafe0f8d948842c2b7c9f7f0'
            '61e7c03cb0d0281912e9d85267becedd30745fc39025d98d1fb252f7f8fb5c48'
            '2e3c0cdd2d887562d98f8914af8894271b6135a6faeb7eca4f6fa3b59a590286'
            'd8d12c72176e1f7aba9443007f72a7ab7bb8f8d677757db24630dc593eaf978c'
            '3c420dabd2aac2e80c04de10686c4bd50c2ffdd46f7b81c030f27ca9be53ada0'
            'f6ce1cc258aeac4f4f60e21556463d2c2458c559ed0c08dc0823e0971737af5e')


prepare() {
	cd "$srcdir/${_srcname}"
 	patch -Np0 -i ../false_error.patch
 	patch -Np1 -i ../lib32_makefile.patch
  patch -Np1 -i ../lib32_ctr.patch
  patch -Np1 -i ../ladspa_multilib.patch
 	patch -Np0 -i ../lib32-alsaequal_caps_9.x.patch
  patch -Np1 -i ../0003-use-alsaequal_bin.patch
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
