# Contributor: Jaroslaw Rosiek <philosoph@interia.pl>
pkgname=cc65
pkgver=2.13.3
pkgrel=3
pkgdesc="C compiler for 6502 family microprocessors"
makedepends=('linuxdoc-tools')
arch=('i686' 'x86_64')
license=('custom')
options=('!makeflags')    # Does not build with parallel jobs
url="http://www.cc65.org/"
source=("ftp://ftp.musoftware.de/pub/uz/cc65/cc65-sources-$pkgver.tar.bz2"
        "patch-$pkgver.diff"
        "license")
sha256sums=('a98a1b69d3fa15551fe7d53d5bebfc5f9b2aafb9642ee14b735587a421e00468'
            'b4bf9bba08ec3a8b6bad8e75be98b136556de72beaee3a99016bb20a1bed929c'
            '4b1eb4cf61617a78256b5225784a73077c238aea02d6b949ef6f1ea06d9b40d3')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/patch-$pkgver.diff"
}

build() {
  cd "$srcdir/cc65-$pkgver"
  make -f make/gcc.mak
}

package() {
  cd "$srcdir/cc65-$pkgver"
  make -f make/gcc.mak DEST_DIR="$pkgdir/" install
  install -Dm644 "$srcdir/license" "$pkgdir/usr/share/licenses/$pkgname/license"
}
