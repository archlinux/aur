# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=asignify
pkgver=1.0
pkgrel=1
pkgdesc="Yet another signify tool"
arch=('i686' 'x86_64')
depends=('openssl')
makedepends=('binutils'
             'gcc'
             'make'
             'pkg-config')
url="https://github.com/vstakhov/asignify"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/vstakhov/$pkgname/tar.gz/$pkgver)
sha256sums=('81272713900b51049633139549181fa23e56eeb580e0ea0325546d2fe7ca503d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 "Building..."
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/asignify \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/asignify \
    --localstatedir=/var/lib/asignify \
    --with-gnu-ld \
    --enable-openssl
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
