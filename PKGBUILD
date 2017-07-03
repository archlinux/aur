#
# PKGBUILD for libmpsse
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=libmpsse
pkgver=1.3
pkgrel=3
epoch=
pkgdesc="Open source library for SPI/I2C control via FTDI chips"
arch=('i686' 'x86_64')
url="https://code.google.com/archive/p/libmpsse/"
license=('GPL2')
groups=()
depends=('libftdi')
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
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "patch-src_configure_ac.patch"
        "patch-src_Makefile.in.patch")
noextract=()
md5sums=('628eb9a7d7250070f5841ed44a248f84'
         '445622b02dacf3ced0052a8d91916991'
         '8becca7dd696d9ac2f72932760c80a8e')


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 -i "${srcdir}/patch-src_configure_ac.patch"
  patch -p0 -i "${srcdir}/patch-src_Makefile.in.patch"
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  autoconf
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  sh configure --prefix=/usr --disable-python
  make all
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  make DESTDIR="${pkgdir}/" install
}

# EOF
