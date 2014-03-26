# Contributor: Jaroslaw Rosiek <philosoph@interia.pl>
pkgname=cc65
pkgver=2.13.3
pkgrel=2
pkgdesc="C compiler for 6502 family microprocessors"
makedepends=('linuxdoc-tools')
arch=('i686' 'x86_64')
license=('custom')
options=('!makeflags')    # Does not build with parallel jobs
url="http://www.cc65.org/"

source=("ftp://ftp.musoftware.de/pub/uz/cc65/cc65-sources-$pkgver.tar.bz2"
        "patch-$pkgver.diff"
	"license")
md5sums=('99de534c4a9e04b45a82c239ed4ded20'
         '7847d388e8b128ed2fb5025ef199956d'
         '8319a72050fb79daf7e1b2bcf5a9e69d')

build() {
  cd "$srcdir/cc65-$pkgver"
  patch -p1 < ../../patch-$pkgver.diff
  make -f make/gcc.mak
}

package() {
  cd "$srcdir/cc65-$pkgver"
  make -f make/gcc.mak DEST_DIR="$pkgdir/" install
  install -Dm644 "$srcdir/license" "$pkgdir/usr/share/licenses/$pkgname/license"
}
