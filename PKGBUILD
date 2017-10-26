# Maintainer: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=xdrawchem
pkgver=1.10.2
pkgrel=1
pkgdesc='XDrawChem is a two-dimensional molecule drawing program for Unix operating systems. It is similar in functionality to other molecule drawing programs such as ChemDraw (TM, CambridgeSoft).'
url='http://www.woodsidelabs.com/chemistry/xdrawchem.php'
license=("GPL")
arch=('x86_64')
depends=('openbabel')
optdepends=()
makedepends=()
options=('!libtool')
source=(https://github.com/bryanherger/${pkgname}/archive/${pkgver}-1.tar.gz)
sha1sums=('4ff8dbaa71b875470d8ca40a0f1af57746fcc644')

build() {
  msg2 "Building"
  cd ${srcdir}/${pkgname}-${pkgver}-1/xdrawchem-qt5
  qmake PREFIX="/usr/"
  make 
}

package() {
  msg2 "Making executables"
  cd ${srcdir}/${pkgname}-${pkgver}-1/xdrawchem-qt5
  #bin
  install -D -m 0755 bin/xdrawchem ${pkgdir}/usr/bin/xdrawchem
  #shared
  mkdir -p  ${pkgdir}/usr/share/xdrawchem
  chmod 0755 ${pkgdir}/usr/share/xdrawchem
  cp ring/* ${pkgdir}/usr/share/xdrawchem
  #doc
  mkdir -p ${pkgdir}/usr/share/xdrawchem/doc
  chmod 0755 ${pkgdir}/usr/share/xdrawchem/doc
  cp doc/* ${pkgdir}/usr/share/xdrawchem/doc

  #make DESTDIR=${pkgdir} install # DESTDIR does not work
}
