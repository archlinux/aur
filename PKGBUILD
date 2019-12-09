# Maintainer: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau gmail com>

pkgname=chroma
pkgver=1.17
pkgrel=1
pkgdesc="Abstract puzzle game."
arch=('i686' 'x86_64')
url="http://www.level7.org.uk/chroma/"
license=('GPL')
depends=('sdl_image' 'ncurses' 'freetype2')
makedepends=('make' 'gettext')
source=("http://www.level7.org.uk/${pkgname}/download/${pkgname}-${pkgver}.tar.bz2"
        "${pkgname}.desktop")

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i 's/inline//g' sdlshadowdisplay.c
  # Thanks goes to Phobian for the sed line.
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    ./configure --prefix=/usr
    make
}
package() {
    cd ${srcdir}/${pkgname}-${pkgver}

    make DESTDIR=${pkgdir} install
    install -Dm644 ../${pkgname}.desktop \
        ${pkgdir}/usr/share/applications/${pkgname}.desktop
}

md5sums=('d42c291ebccad5350896978d1cc2d28e'
         '90932d9a42f1545c3ba59ae38afb7732')
