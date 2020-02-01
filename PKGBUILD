# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=git-merge-changelog-git
pkgdesc="git merge driver for GNU style ChangeLog files."
pkgver=0.1.r3232.gffcdc4580
pkgrel=1
arch=('i686' 'x86_64')
url="http://savannah.gnu.org/projects/gnulib"
license=('GPLv2')
provides=("git-merge-changelog=${pkgver}")
makedepends=('git')
source=("git://git.savannah.gnu.org/gnulib.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/gnulib"
  git describe --always --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/gnulib"
  ./gnulib-tool --create-testdir --dir="$srcdir/$pkgname-$pkgver" git-merge-changelog
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
