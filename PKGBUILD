# Maintainer: Guillaume Gauvrit <guillaume@g>
pkgname=perceptualdiff-git
pkgver=1.2.69.g5570d71
pkgrel=1
pkgdesc="A fork of the perceptualdiff image comparison tool (pdiff.sourceforge.net) with OpenMP support "
arch=('i686' 'x86_64')
url="https://github.com/myint/perceptualdiff"
license=('GPL2')
groups=()
epoch=1
depends=('freeimage')
makedepends=('cmake' 'git')
provides=('perceptualdiff')
conflicts=('pdiff-svn')
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/myint/perceptualdiff.git')
noextract=()
md5sums=('SKIP')
_pkgname=perceptualdiff

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags | sed -e 's/^v//;y/-/./'
}

prepare() {
  cd "$srcdir/perceptualdiff"
}

build() {
  cd "$srcdir/perceptualdiff"
  cmake .
  make
}

package() {
  cd "$srcdir/perceptualdiff"
  make install DESTDIR="$pkgdir/"
  install -D -m 644 "$srcdir/perceptualdiff/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

