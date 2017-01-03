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
        'fix-lib32-makefile.patch'
		'lib32-alsaequal_caps_9.x.patch')

md5sums=('d2edc7710c72cbf3ab297c414e35ebda'
         '15bbaaa51bf3e01fdc1af1cd3b0b53e3'
         '40911a2eedc8fdb85b68bb81ccea65eb'
         '9b58c23a264e59b672eccbf3f8c0663b'
         '212e7c8bf7cb2f83b476894dde58812b')

prepare() {
	cd "$srcdir/${_srcname}"
	patch -Np0 -i ../false_error.patch
	patch -Np0 -i ../alsaequal.patch
	patch -Np1 -i ../fix-lib32-makefile.patch
	patch -Np0 -i ../lib32-alsaequal_caps_9.x.patch
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
