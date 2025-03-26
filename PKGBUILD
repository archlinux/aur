# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="pmount-gui"
_commit="b70580815b02ba5ccf83d8d96c5138afbc7124ae" # r47
pkgver="r47+g${_commit::7}"
pkgrel=2
pkgdesc="A simple graphical frontend for pmount"
arch=('x86_64')
url="https://www.tdb.fi/pmount-gui.shtml"
_url="http://git.tdb.fi/?p=pmount-gui.git"
license=('BSD-2-Clause')
depends=('glib2' 'glibc' 'gtk2' 'pmount' 'udev')
_pkgsrc="${pkgname}-${_commit::7}"
source=("${_pkgsrc}.tar.gz::${_url};a=snapshot;h=${_commit};sf=tgz")
sha256sums=('f4841bc67f207d3dd55d809f18d27b71951ad66ae15e8bc28ba4cc1e304e87b0')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e 's|"/bin|"/usr/bin|g' \
      -e 's|"/sbin|"/usr/bin|g' \
      -i 'main.c'
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  # make
  gcc ${CFLAGS} -std=c90 ${LDFLAGS} -o "${pkgname}" main.c $(pkg-config --cflags --libs gtk+-2.0)
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${pkgname}"  "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.txt"  "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
