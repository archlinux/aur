# Maintainer: Liam Greenough <beacon515@gmail.com>
pkgname=qt-dab-git
pkgver=r306.0b6c309
pkgrel=1
pkgdesc="software dab decoder for use with a dabstick, airspy or sdrplay for RPI and PC"
arch=('i686' 'x86_64')
url="http://www.sdr-j.tk"
license=('GPL2')
depends=('qt5-base' 'libsndfile' 'fftw' 'portaudio' 'faad2' 'zlib' 'rtl-sdr' 'qwt' 'libsamplerate')
makedepends=('git')
provides=('qt-dab-git')
conflicts=('qt-dab' 'sdr-j-dabreciever')
source=('git+https://github.com/JvanKatwijk/qt-dab.git' 'qwt.patch')
md5sums=('SKIP'
         'd5a96a8f58268c892f33e9ed56fc16e9')

pkgver() {
	cd "$srcdir/qt-dab"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
 cd "$srcdir/qt-dab"
 patch -i "${srcdir}/qwt.patch"
}

build() {
	cd "$srcdir/qt-dab"
	qmake qt-dab.pro
	make
}

package() {
	mkdir $pkgdir/usr/ $pkgdir/usr/bin
	cd "$srcdir/qt-dab/linux-bin"
	mv * /$pkgdir/usr/bin/qt-dab
}
