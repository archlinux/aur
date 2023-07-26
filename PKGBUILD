# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Dragonlord <dragonlord[at]seznam[.]cz>
# Contributor: daniel <quite a hack org>

pkgname=fim
_pkgver='0.6-rc1'
pkgver=${_pkgver/-}
pkgrel=1
pkgdesc='FIM (Fbi IMproved) is a highly customizable and scriptable image viewer.'
arch=('i686' 'x86_64')
url='https://www.nongnu.org/fbi-improved/'
license=('GPL2')
depends=('giflib' 'libjpeg-turbo' 'libexif' 'sdl' 'terminus-font')
source=("http://download.savannah.gnu.org/releases/fbi-improved/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('79b7a0ed38efa1fb0bc25fe47e1d2e2a30fa832ba57a8c5b1a05f7de64bd7a63')

build() {
  cd "${pkgname}-${_pkgver}"

  ./configure LIBS=-lpthread --prefix=/usr --disable-debug --enable-hardcoded-font --disable-xcftopnm \
    --disable-ps --disable-inkscape --disable-djvu --disable-xfig --disable-dia --disable-imlib2 \
    --enable-sdl --disable-convert

  make
}

package() {
  cd "${pkgname}-${_pkgver}"

  make DESTDIR=${pkgdir} install
}
