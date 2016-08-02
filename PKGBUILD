# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname=littleutils
pkgname=littleutils-full
pkgver=1.0.36
pkgrel=1
pkgdesc="Utilities for compression, file manipulation, text cleanup, and images/PDF optimization (with all features and extras)"
arch=('i686' 'x86_64')
url="http://littleutils.sourceforge.net/"
license=('custom' 'GPL3')
depends=('bash' 'dash' 'perl' 'python2' 'file' 'gifsicle' 'libjpeg-turbo' 'libpng'
         'pngcrush' 'bzip2' 'gzip' 'lzip' 'lzma_alone' 'lzop' 'xz' 'p7zip' 'wget'
)
provides=('littleutils')
conflicts=('littleutils')
source=("https://sourceforge.net/projects/littleutils/files/littleutils-source/${pkgver}/littleutils-${pkgver}.tar.xz")
sha256sums=('751de66212c609434233beae27d551d666821e0a6ddba9c38aa56f5a7dba9c49')

build() {
	cd "$_srcname"-"$pkgver"
	
	./configure --prefix=/usr
	
	make
}

package() {
	cd "$_srcname"-"$pkgver"
	
	make DESTDIR="$pkgdir/" install
	make DESTDIR="$pkgdir/" install-extra
	
	install -D -m644 LICENSES "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES"
}
