#
# PKGBUILD for libmpsse-python
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=libmpsse-python
pkgver=1.3
pkgrel=1
epoch=
pkgdesc="Open source library for SPI/I2C control via FTDI chips"
arch=('i686' 'x86_64')
url="http://code.google.com/p/libmpsse/"
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
source=("http://$_pkgname.googlecode.com/files/$_pkgname-$pkgver.tar.gz"
        "patch-src_configure_ac.patch")
noextract=()
md5sums=('628eb9a7d7250070f5841ed44a248f84'
         '445622b02dacf3ced0052a8d91916991')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p0 -i "$srcdir/patch-src_configure_ac.patch"
  cd "$srcdir/$_pkgname-$pkgver/src"
  autoconf
}

build() {
  cd "$srcdir/$_pkgname-$pkgver/src"
  sh configure
  make pyswig-build
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  #make -k check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/src"
  make DESTDIR="$pkgdir/" pyswig-install
}

# EOF
