# Maintainer: Tim Lewis <tyls at zeoliq dot com>
pkgname=ziplib-git
_pkgname=ziplib
pkgver=0.1
pkgrel=1
pkgdesc="Petr Beneš C++11 library for working with Zip archives with ease."
license=('custom')
arch=('x86_64')
url='https://bitbucket.org/wbenny/ziplib/wiki/Home'
options=(!libtool)
makedepends=(make clang git rsync)
source=("git+https://bitbucket.org/wbenny/ziplib.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/ziplib"

  libdir="$pkgdir/usr/lib/"
  includedir="$pkgdir/usr/include/$_pkgname"

  mkdir -p $libdir
  mkdir -p $includedir

  cp Bin/libzip.so $libdir/lib$_pkgname.so
  install -D -m644 Licence.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  cd Source/ZipLib
  find . -name '*.h' -exec rsync -rR {} $includedir \;
}
