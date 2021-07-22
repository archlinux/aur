# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=fungw
pkgver=1.2.0
pkgrel=1
pkgdesc="tiny, portable library written in C (C89) that manages dynamic function calls across different programming languages"
url="http://www.repo.hu/projects/fungw/"
arch=('i686' 'x86_64')
license=('LGPL2')
depends=('genht')
# fungw is not strictly dependant on genht (it also embeds it), but other packages relying on fungw also can optionally use external genht, and we don't want them to use different versions
optdepends=('lua' 'perl' 'tcl' 'python2' 'python' 'duktape' 'mujs' 'libmawk>=1.0.3')
# picolisp could not compile
# there is no estutter package
# there is no funlist package
# compilation against mruby fails because mruby is missing the -fPIC compile flag
source=("http://www.repo.hu/projects/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('0b1b9c281d5b9722b85ded2b793ff2c21c3b530484ef3c2276fc041ae2161f36')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
