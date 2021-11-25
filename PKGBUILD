# Maintainer: nyanpasu64 <nyanpasu64 at tuta dot io>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=polyphone-git
_basename=${pkgname%-git}
pkgver=2.2.0.r98.5d9179b6
pkgrel=2
pkgdesc="A soundfont editor for quickly designing musical instruments"
arch=('x86_64')
url="https://polyphone-soundfonts.com/en/"
license=('GPL3')
groups=('pro-audio')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'openssl' 'qt5-base' 'qt5-svg'
	'rtmidi' 'zlib')
makedepends=('flac' 'jack' 'libogg' 'libvorbis' 'portaudio' 'qcustomplot'
	'qt5-tools' 'stk')
provides=("${_basename}")
conflicts=("${_basename}")
source=('git+https://github.com/davy7125/polyphone.git')
sha512sums=('SKIP')
b2sums=('SKIP')

pkgver() {
	cd "$srcdir/$_basename"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${_basename}/sources"
	qmake-qt5 "${_basename}.pro" PREFIX="${pkgdir}/usr"
	make
}

package() {
	depends+=('libFLAC.so' 'libjack.so' 'libogg.so' 'libportaudio.so'
		'libqcustomplot.so' 'libstk-4.6.2.so' 'libvorbis.so' 'libvorbisenc.so'
		'libvorbisfile.so')
	cd "$srcdir/${_basename}/sources"
	make install
}
