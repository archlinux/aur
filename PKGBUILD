# Maintainer: Omar Roth <omarroth@hotmail.com>

pkgname=libmarpa
pkgver=8.6.2
pkgrel=2
pkgdesc="Marpa parse engine C library"
arch=('i686' 'x86_64')
makedepends=('autoconf' 'automake' 'libtool' 'make' 'perl' 'texlive-bin')
url="https://github.com/jeffreykegler/libmarpa"
license=('MIT')
source=($pkgname-$pkgver::git+https://github.com/jeffreykegler/libmarpa)
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Preparing distribution...'
  make dists
}

build() {
  cd "$srcdir/$pkgname-$pkgver/dist"

  msg2 'Building...'
    ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/libmarpa \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/libmarpa \
    --localstatedir=/var/lib/libmarpa \
    --with-gnu-ld
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/dist"

  msg2 'Installing license...'
  install -Dm 644 AUTHORS COPYING{,.LESSER} \
          -t "$pkgdir/usr/share/licenses/libmarpa"

  msg2 'Installing documentation...'
  install -Dm 644 README{,.INSTALL} -t "$pkgdir/usr/share/doc/libmarpa"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
