# Maintainer: Ryon Sherman <ryon.sherman@gmail.com>

_pkgname="truecrack"

pkgname="${_pkgname}-svn"
pkgrel=1
pkgver=50
pkgdesc="TrueCrack is a brute-force password cracker for TrueCrypt volume files."

provides=(${_pkgname})

arch=('i686' 'x86_64')
license=('GPL3')
url="https://code.google.com/p/${_pkgname}"

makedepends=('svn' 'gcc')
optdepends=('cuda: GPU Support')

source=("svn+http://${_pkgname}.googlecode.com/svn")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/svn
  svnversion | tr -d [A-z]
}

build() {
    cd ${srcdir}/svn
    ./configure --prefix=/usr --enable-cpu
    make
}

package() {
  cd ${srcdir}/svn

  install -d ${pkgdir}/usr/share/licenses/${_pkgname}
  install -Dm0644 COPYING ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE

  make DESTDIR=${pkgdir} install
}
