#
# PKGBUILD for ADFlib
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=adflib
pkgver=0.7.12
pkgrel=1
epoch=
pkgdesc="A free, portable and open implementation of the Amiga filesystem"
arch=('i686', 'x86_64')
_pkgname=ADFlib
url="http://lclevy.free.fr/adflib/unadf.html"
license=('GPL')
groups=()
depends=('glibc')
makedepends=()
checkdepends=()
optdepends=('unadf')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/tonigi/${_pkgname}/archive/${pkgver}.tar.gz)
noextract=()
md5sums=('af11dbb3f79ef799538c9f03cd5a40cd')


prepare() {
  cd "$srcdir/${_pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sh autogen.sh
  #sh configure --prefix="${pkgdir}/"
  sh configure
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  rm -rf "${pkgdir}/usr/local/bin/unadf"
  rmdir "${pkgdir}/usr/local/bin/"
}

# EOF
