# Maintainer: Vianney le Clément <code AT quartic·eu>
_pkgname=jbig2enc
pkgname=$_pkgname-git
pkgver=0.32.8.geb30816
pkgrel=1
pkgdesc="A JBIG2 image encoder"
arch=('i686' 'x86_64')
url="https://github.com/agl/jbig2enc"
license=('Apache')
depends=('gcc-libs' 'leptonica>=1.74' 'libpng' 'libjpeg-turbo' 'libtiff')
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
