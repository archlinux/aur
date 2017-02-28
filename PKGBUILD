# Maintainer: Dacoda Strack <dacoda.strack@gmail.com>

pkgname=cl-bordeaux-threads
pkgver=0.8.5
pkgrel=1
pkgdesc="Portable shared-state concurrency for Common Lisp"
arch=('any')
url="https://common-lisp.net/project/bordeaux-threads/"
license=('MIT')
depends=('cl-alexandria')
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
source=("git+https://github.com/sionescu/bordeaux-threads.git#commit=92e6a89486a9469a36b4c0f73f4efc38f4ddeecc")
# noextract=()
md5sums=(SKIP)
# validpgpkeys=()

pkgver() {
  cd ${pkgname#cl-}
  echo $(cat version.sexp | tail -n1 | sed -e 's/\"\(.*\)\"/\1/')
}

package() {
  # cd into source, removing cl- prefix from package name
  cd ${pkgname#cl-}

  # install documentation
  install -d ${pkgdir}/usr/share/doc/$pkgname/
  install -m644 -t ${pkgdir}/usr/share/doc/$pkgname/ site/*

  # install sources
  install -d ${pkgdir}/usr/share/common-lisp/source/${pkgname}
  install -d ${pkgdir}/usr/share/common-lisp/source/${pkgname}/src
  install -d ${pkgdir}/usr/share/common-lisp/systems
  
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname}/src src/*.lisp
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} version.sexp
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} *.asd

  # link asd files
  cd ${pkgdir}/usr/share/common-lisp/systems
  ln -s ../source/${pkgname}/*.asd .
}
