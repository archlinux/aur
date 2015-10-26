# $Id$
# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>
# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>

pkgname=yaxt
pkgver=0.4.2
pkgrel=1
pkgdesc="Yet Another eXchange Tool"
arch=("i686" "x86_64")
url="https://www.dkrz.de/redmine/projects/yaxt"
depends=('openmpi')
options=('!libtool' '!makeflags')
license=('custom')
source=(https://www.dkrz.de/redmine/attachments/download/463/${pkgname}-${pkgver}.tar.xz LICENSE)
md5sums=('4da68f182c5ea87f6921dfe46d2e3f96'
         '49dfdde5efdb4300973164ae321f549c')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr CC=mpicc FC=mpif90 FCFLAGS="$FCFLAGS -cpp"
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
