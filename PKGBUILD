# Maintainer: Ivan Naumeiko  <Ivan.Naumeiko  AT gmail DOT com>
pkgname=coolreader
pkgver=3.1.2.71
pkgrel=2
pkgdesc="E-book reader for Linux, QT5 based"
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/crengine/"
license=("GPL2")
depends=("zlib" "libpng" "libjpeg" "freetype2" "qt5-base")
makedepends=("cmake" "qt5-tools")
provides=("coolreader")
conflicts=("coolreader3" "coolreader-git" "cr3")
install="${pkgname}.install"
source=("https://dev.gentoo.org/~grozin/coolreader-3.1.2.71.tar.bz2" "cr3.1.2.71-r1_qt5_wx.diff" "cr3ini.diff" "lvstsheet.diff" "coolreader.install")
sha256sums=("746345984be549284713a450686f0c8b04f1485f9a28bedc457940ea1b52f7d1" 
	    "54090908b2e20a33888a85cf8d5a371b624c54a002ea164b1a01ff5cfe856838" 
	    "8028aaf8bb1b3dbf0d48333240f83bbb9ef1b71a344b1ddce4bbe47cd9c35f29" 
	    "108881fa591be677d4a78444557d543d47b3ec8fd22f6c665a764edcf3fb25e6"
	    "e84837cb485712690df4e0034e2d402d259813aae1b58b411919afc8df3b7c97")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/cr3ini.diff"
    patch -Np1 -i "${srcdir}/cr3.1.2.71-r1_qt5_wx.diff"
    patch -Np1 -i "${srcdir}/lvstsheet.diff"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    mkdir build
    cd build
    
    cmake -DGUI=QT5 -DCMAKE_BUILD_TYPE=Release -DMAX_IMAGE_SCALE_MUL=2 -DDOC_DATA_COMPRESSION_LEVEL=3 -DDOC_BUFFER_SIZE=0x1400000 -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}