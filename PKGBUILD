# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Dragonlord <dragonlord[at]seznam[.]cz>
# Contributor: daniel <quite a hack org>

pkgname=fim
_pkgver='trunk'
pkgver=0.7
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
            'libjpeg-turbo: JPEG support'
            'libpng: PNG support'
            'libspectre: postscript support'
            'libtiff: TIFF support'
            'sdl: X support')
source=("http://download.savannah.gnu.org/releases/fbi-improved/${pkgname}-${pkgver}-${_pkgver}.tar.gz")
sha256sums=('f5b2442c67d0111bfefc06ee8a00c923fe9b992efd62b9c070e191f7d83c07ea')

prepare() {
  cd "${pkgname}-${pkgver}-${_pkgver}"

  sed -i 's/fim_handle_webp =no/fim_handle_webp=no/g' configure.ac
  sed -i 's/fim_handle_webp =no/fim_handle_webp=no/g' configure
}

build() {
  cd "${pkgname}-${pkgver}-${_pkgver}"

  PKG_CONFIG=/usr/bin/pkg-config ./configure \
    LIBS=-lpthread --prefix=/usr --disable-debug \
    --enable-hardcoded-font --disable-avif --disable-webp

  make
}

package() {
  cd "${pkgname}-${pkgver}-${_pkgver}"

  make DESTDIR=${pkgdir} install
}
