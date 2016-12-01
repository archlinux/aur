# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Antony Male <antony dot male at geemail dot com>>

pkgname=libsnappy
pkgver=1.1.3
pkgrel=4
pkgdesc="A fast compression/decompression library"
arch=('i686' 'x86_64')
makedepends=('autoconf' 'automake' 'git' 'libtool' 'm4' 'make' 'pkg-config')
url="https://google.github.io/snappy/"
license=('BSD')
source=($pkgname-$pkgver::git+https://github.com/google/snappy)
sha256sums=('SKIP')
provides=('snappy')
conflicts=('snappy')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  # compile without assertions
  export CXXFLAGS+=\ -DNDEBUG
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/snappy \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/snappy \
    --localstatedir=/var/lib/snappy \
    --with-gnu-ld
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libsnappy"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
