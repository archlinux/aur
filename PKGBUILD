# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=frei0r-plugins-git
pkgver=v1.2.1.r258.g954fbe3
pkgrel=1
pkgdesc="A minimalistic plugin API for video sources and filters (Git version)"
arch=('i686' 'x86_64')
url="https://www.dyne.org/software/frei0r/"
license=('GPL2')
depends=('gcc-libs' 'gavl' 'cairo' 'opencv')
makedepends=('git')
provides=('frei0r-plugins')
conflicts=('frei0r-plugins')
source=("$pkgname"::'git://code.dyne.org/frei0r.git')
# source=("$pkgname"::'git+https://github.com/ddennedy/frei0r.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

        # Git, tags available
        printf "%s" "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
	cd "${srcdir}/${pkgname}"
	
        ./autogen.sh        
}

build() {
	cd "${srcdir}/${pkgname}"
	
	./configure \
                --prefix=/usr \
                --enable-static=no \
                --enable-shared=yes
	
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	
	make DESTDIR="$pkgdir/" install
}
