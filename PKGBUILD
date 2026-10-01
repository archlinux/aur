# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Dragonlord <dragonlord[at]seznam[.]cz>
# Contributor: daniel <quite a hack org>

pkgname=fim
pkgver=0.8.0
pkgrel=2
pkgdesc='FIM (Fbi IMproved) is a highly customizable and scriptable image viewer.'
arch=('i686' 'x86_64')
url='https://www.nongnu.org/fbi-improved/'
license=('GPL-2.0-or-later')
depends=('libexif' 'terminus-font')
optdepends=('aalib: ASCII art support'
            'djvulibre: djvu support'
            'giflib: GIF support'
            'imagemagick: use convert for unrecognized files'
	    'libavif: avif support'
	    'libheif: heif/heic support'
            'libjpeg-turbo: JPEG support'
            'libpng: PNG support'
            'libspectre: postscript support'
            'libtiff: TIFF support'
	    'libwebp: WebP support'
            'sdl: X support')
source=("http://download.savannah.gnu.org/releases/fbi-improved/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3db4051d1a8402a4ddb8c5e0e1dcd829e426adf7c75698235c5c2c09c23a497a')

build() {
  cd "${pkgname}-${pkgver}"

  PKG_CONFIG=/usr/bin/pkg-config ./configure \
    LIBS=-lpthread --prefix=/usr --disable-debug \
    --enable-hardcoded-font

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR=${pkgdir} install
}
