#
# PKGBUILD for libmpsse-python
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=libmpsse-python
pkgver=1.3
pkgrel=2
epoch=
pkgdesc="Open source library for SPI/I2C control via FTDI chips"
arch=('i686' 'x86_64')
url="https://code.google.com/archive/p/libmpsse/"
license=('GPL2')
groups=()
depends=('libmpsse' 'swig' 'python')
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
_pkgname=libmpsse
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "patch-src_configure_ac.patch"
        "patch-src_Makefile.in.patch")
noextract=()
md5sums=('628eb9a7d7250070f5841ed44a248f84'
         '445622b02dacf3ced0052a8d91916991'
         '8becca7dd696d9ac2f72932760c80a8e')


prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p0 -i "${srcdir}/patch-src_configure_ac.patch"
  patch -p0 -i "${srcdir}/patch-src_Makefile.in.patch"
  cd "${srcdir}/${_pkgname}-${pkgver}/src"
  autoconf
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/src"
  sh configure --prefix=/usr
  make pyswig-build
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  #make -k check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/src"
  make DESTDIR="${pkgdir}/" pyswig-install
}

# EOF
