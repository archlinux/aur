# Maintainer: Anatol Pomozov <anatol@google.com>
pkgname=google-coredumper
pkgver=1.2.1
pkgrel=1
pkgdesc='Library can be compiled into applications to create core dumps of the running program -- without terminating.'
url='https://code.google.com/p/google-coredumper/'
license=(GPL)
arch=(i686 x86_64)
# Upstream is currently broken.
# Here are fixs for upstream https://github.com/anatol/google-coredumper
source=(https://google-coredumper.googlecode.com/files/coredumper-$pkgver.tar.gz
        fixes.diff)
sha1sums=('8f770458bca2d0eea878689b5ae2329d7d21d450'
          '11d4cc83b2e02210d21271fda608c9a2c2ac8716')

prepare() {
  cd coredumper-$pkgver
  patch -p1 < "$srcdir/fixes.diff"
}

build() {
  cd coredumper-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd coredumper-$pkgver
#  The tests are broken because they expect binaries with debug symbols. Fix the tests.
#  make check
}

package() {
  cd coredumper-$pkgver
  make install DESTDIR="$pkgdir"
}
