# Maintainer: Félicien PILLOT <felicien.pillot@member.fsf.org>
pkgname=fisoco
pkgver=0.3
pkgrel=2
pkgdesc="a Finding, Sorting and Converting free software"
url="https://github.com/Felandral/Fisoco"
arch=('any')
license=('GPLv3')
depends=()
makedepends=('git' 'gtkmm3' 'intltool')
conflicts=()
replaces=()
backup=()
source=("${pkgname}-${pkgver}::git+http://github.com/Felandral/Fisoco#branch=master")
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/$pkgname-$pkgver"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  echo "Generating local autoconf macros..."
  aclocal
  echo "Generating translations Makefile..."
  intltoolize
  echo "Running Autotools..."
  autoreconf
  echo "Running configure..."
  ./configure
  sleep 1
  echo "Compiling..."
  sleep 1
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

