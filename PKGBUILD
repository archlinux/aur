# Maintainer: Vianney le Clément <code AT quartic·eu>
_pkgname=jbig2enc
pkgname=$_pkgname-git
pkgver=0.29.20.gc0141bf
pkgrel=2
pkgdesc="A JBIG2 image encoder"
arch=('i686' 'x86_64')
url="https://github.com/agl/jbig2enc"
license=('Apache')
depends=('gcc-libs' 'leptonica>=1.68' 'libpng' 'libjpeg' 'libtiff')
optdepends=('python: for jbig2topdf.py')
provides=('jbig2enc')
conflicts=('jbig2enc')
makedepends=('git')
source=("git+https://github.com/agl/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make install DESTDIR="$pkgdir"
}
