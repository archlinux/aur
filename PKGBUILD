#Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>
#Contributor:	Jussi Timperi	<gmail.com: jussi.timperi>

pkgname=malaga
pkgver=7.12
pkgrel=5
pkgdesc="A software for the development and application of grammars that are used for the analysis of words and sentences of natural languages."
arch=('i686' 'x86_64')
url="http://home.arcor.de/bjoern-beutel/malaga/"
license=('GPL2')
depends=('gtk2')
makedepends=('texinfo')
options=(!libtool)
install=malaga.install
source=(http://home.arcor.de/bjoern-beutel/${pkgname}/${pkgname}-${pkgver}.tgz)
md5sums=('873b292d923e2d1c0643769aa58c1882')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr     ### ./configure does not add respect LIBS= variable :(
  sed 's|-lgtk-x11-2.0|-lm -lgtk-x11-2.0|' -i Makefile ####Thats why we need this sed clause...
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/info/dir"
}

# vim:set ts=2 sw=2 et:
