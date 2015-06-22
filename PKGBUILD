#
# PKGBUILD for libmpsse
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=libmpsse
pkgver=1.3
pkgrel=2
epoch=
pkgdesc="Open source library for SPI/I2C control via FTDI chips"
arch=('i686' 'x86_64')
url="http://code.google.com/p/libmpsse/"
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
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz"
        "patch-src_configure_ac.patch")
noextract=()
md5sums=('628eb9a7d7250070f5841ed44a248f84'
         '445622b02dacf3ced0052a8d91916991')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 -i "$srcdir/patch-src_configure_ac.patch"
  cd "$srcdir/$pkgname-$pkgver/src"
  autoconf
}

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  #sh configure
  sh configure --disable-python
  make all
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  #make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make DESTDIR="$pkgdir/" install
}

# EOF
