# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=1.26
pkgrel=1
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('i686' 'x86_64')
depends=('python')
makedepends=('asciidoc')
url="http://www.catb.org/esr/cvs-fast-export/"
license=('GPL2')
source=(http://www.catb.org/~esr/$pkgname/$pkgname-$pkgver.tar.gz
        install-cvsconvert.patch)
sha256sums=('ebca4b19ba9045bc1b733f729042d7a98dd6675dac3030239f718b13a99949ed'
            'fd45067e8329811ca059aafb4df8a3bfced8b5a3023ba566dff25cfa4de84d66')

prepare() {
  cd ${pkgname}-${pkgver}

  patch -p1 -i ../install-cvsconvert.patch
}

build() {
  cd ${pkgname}-${pkgver}

  make $pkgname{,.1} cvssync.1
  2to3 -w cvssync cvsconvert
}

package() {
  cd ${pkgname}-${pkgver}

  make prefix=/usr DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
