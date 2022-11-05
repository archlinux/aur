# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Dragonlord <dragonlord[at]seznam[.]cz>
# Contributor: daniel <quite a hack org>

pkgname=fim
_pkgname='trunk'
pkgver=0.6
pkgrel=6
pkgdesc='FIM (Fbi IMproved) is a highly customizable and scriptable image viewer.'
arch=('i686' 'x86_64')
url='https://www.nongnu.org/fbi-improved/'
license=('GPL2')
optdepends=('djvulibre: djvu support'
            'libspectre: postscript support'
            'sdl: X support'
            'poppler: PDF support')
depends=('giflib' 'libjpeg-turbo' 'libexif' 'sdl' 'terminus-font')
source=("https://download.savannah.gnu.org/releases/fbi-improved/${pkgname}-${pkgver}-${_pkgname}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}-${_pkgname}"

  ./configure LIBS=-lpthread --prefix=/usr --disable-debug --enable-unicode \
    --enable-hardcoded-font --disable-xcftopnm --disable-inkscape \
    --disable-xfig --disable-dia --disable-imlib2 --enable-sdl

  make
}

package() {
  cd "${pkgname}-${pkgver}-${_pkgname}"

  make DESTDIR=${pkgdir} install
}
