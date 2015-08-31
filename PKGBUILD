# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Alexander Jenisch <nt@divzero.at>
# Contributor: Chris Brannon <cmbrannon@cox.net>
# Contributor: Andreas Messer <andi@bupfen.de>

pkgname=python2-speechd
pkgver=0.7.1
pkgrel=2
arch=('any')
pkgdesc="Python 2.x bindings for speechd"
url="http://www.freebsoft.org/speechd"
license=('GPL2' 'FDL')
depends=('python2-xdg' 'speech-dispatcher')
makedepends=('intltool' 'espeak')
source=(http://www.freebsoft.org/pub/projects/speechd/speech-dispatcher-$pkgver.tar.gz
        0.8-api-changes.patch)
md5sums=('ccfc30ac006673d36b4223eb760ed696' '5c1072c96ca46ff7f3dbdd354a4e8728')

build() {
  cd "${srcdir}/speech-dispatcher-${pkgver}"
  patch -Np1 -i ../0.8-api-changes.patch
  
  PYTHON=python2 ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --without-flite
  cd src/python
  make
}

package() {
  cd "${srcdir}/speech-dispatcher-${pkgver}/src/python"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share"
  rm -rf "${pkgdir}/usr/bin"
}
