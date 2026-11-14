# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Dragonlord <dragonlord[at]seznam[.]cz>
# Contributor: daniel <quite a hack org>

pkgname=fim
pkgver=0.8.0
pkgrel=3
pkgdesc='FIM (Fbi IMproved) is a highly customizable and scriptable image viewer.'
arch=('i686' 'x86_64')
url='https://www.nongnu.org/fbi-improved/'
license=('GPL-2.0-or-later')
depends=('jasper' 'libexif' 'poppler' 'terminus-font')
optdepends=('aalib: ASCII art support'
            'djvulibre: djvu support'
            'giflib: GIF support'
	          'graphicsmagick: GraphicsMagick support'
	          'gtk3: GTK3 support'
            'imagemagick: use convert for unrecognized files'
	          'libavif: avif support'
	          'libcaca: colour ASCII art support'
	          'libheif: heif/heic support'
            'libjpeg-turbo: JPEG support'
            'libpng: PNG support'
            'libspectre: postscript support'
            'libtiff: TIFF support'
	          'libwebp: WebP support'
	          'qoi: QOI support'
            'sdl: X support')
source=("http://download.savannah.gnu.org/releases/fbi-improved/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.patch")
sha256sums=('2c6b33c834ca41f7a6d6b2020eb4ff5c1facbab40b7c511c8ff93c74492bdd9d'
            '0953f9305068b5c9e0fad21fe7c49a8300504fa68e21f494109ce83257268be1')

prepare() {
  patch -p0 -i ../${pkgname}.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  PKG_CONFIG=/usr/bin/pkg-config ./configure CXXFLAGS="-std=gnu++20 -O2" LIBS=-lpthread \
    --prefix=/usr --disable-debug --enable-poppler --enable-jasper --enable-archive \
    --enable-graphicsmagick --enable-hardcoded-font

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR=${pkgdir} install
}
