# Maintainer: Dacoda Strack <dacoda.strack@gmail.com>

pkgname=cl-store
pkgver=0.8.11
pkgrel=1
pkgdesc="A Common Lisp Serialization Package"
arch=('any')
url="https://common-lisp.net/project/cl-store/"
license=('MIT')
depends=()
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
source=("git+https://github.com/skypher/cl-store#commit=30c55f389b71f2527c5de7477860ee087ac60718")
# noextract=()
md5sums=(SKIP)
# validpgpkeys=()

pkgver() {
  cd ${pkgname}
  echo $(cat readme | grep Version | sed -e 's/Version: \(.*\)/\1/')
}

package() {
  # cd into source, removing cl- prefix from package name
  cd ${pkgname}

  # install documentation
  install -d ${pkgdir}/usr/share/doc/$pkgname/
  install -m644 -t ${pkgdir}/usr/share/doc/$pkgname/ doc/*

  # install sources
  install -d ${pkgdir}/usr/share/common-lisp/source/${pkgname}
  install -d ${pkgdir}/usr/share/common-lisp/source/${pkgname}/sbcl
  install -d ${pkgdir}/usr/share/common-lisp/systems
  
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} *.lisp
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname}/sbcl sbcl/*.lisp
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} *.asd

  # link asd files
  cd ${pkgdir}/usr/share/common-lisp/systems
  ln -s ../source/${pkgname}/*.asd .
}
