# Maintainer: Dacoda Strack <dacoda.strack@gmail.com>

pkgname=cl-fad
pkgver=0.7.4
pkgrel=1
pkgdesc="A portable pathname library for Common Lisp"
url="http://weitz.de/cl-fad/"
arch=('any')
license=('custom:bsd-style')
depends=('sbcl' 'cl-bordeaux-threads' 'cl-alexandria')
# makedepends=()
# checkdepends=()
# optdepends=()
provides=()
conflicts=()
# replaces=()
# backup=()
# options=()
# install=
# changelog=
source=("git+https://github.com/edicl/cl-fad.git#commit=56b0909150d54b2e3aaf2660735702b35558445d")
# noextract=()
md5sums=(SKIP)
# validpgpkeys=()

pkgver() {
  cd ${pkgname}
  echo $(cat CHANGELOG | head -n1 | sed -e 's/Version \(.*\)/\1/')
}

package() {
  cd ${pkgname}

  # install documentation
  install -d ${pkgdir}/usr/share/doc/$pkgname/
  install -m644 -t ${pkgdir}/usr/share/doc/$pkgname/ doc/*

  # install sources
  install -d ${pkgdir}/usr/share/common-lisp/source/${pkgname}
  install -d ${pkgdir}/usr/share/common-lisp/systems
  
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} *.lisp
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} *.asd
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} *.system

  # link asd files
  cd ${pkgdir}/usr/share/common-lisp/systems
  ln -s ../source/${pkgname}/*.asd .
  ln -s ../source/${pkgname}/*.system .
}
