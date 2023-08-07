#
# PKGBUILD for unadf
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=unadf
pkgver=1.0
pkgrel=5
epoch=
pkgdesc="unzip like tool for Commodore Amiga filesystem ADF images"
arch=('i686' 'x86_64')
_pkgname=ADFlib
_pkgver=0.8.0
url="http://lclevy.free.fr/adflib/unadf.html"
license=('GPL')
groups=()
depends=('glibc' 'adflib')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/lclevy/${_pkgname}/archive/refs/tags/v${_pkgver}.tar.gz)
noextract=()
sha256sums=('fa78b6cd1139985c16702b3e64614f5721aa63bb0a060969a92c2e8fc52dd3ed')


prepare() {
  cd "$srcdir/${_pkgname}-${_pkgver}"
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  sh autogen.sh
  sh configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}/" install-exec install-data
  #
  rm -rf "${pkgdir}/usr/lib/"
  rm -rf "${pkgdir}/usr/include/"
  rm -rf "${pkgdir}/usr/share/doc/"
}

# EOF
