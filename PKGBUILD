# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Andrew Boktor <andrew.boktor@gmail.com>
# Contributor: Dmitry Kharitonov <darksab0r@gmail.com>

pkgname=makedepend
pkgver=1.0.5
pkgrel=3
pkgdesc="Create dependencies in Makefiles"
arch=('i686' 'x86_64')
url="http://www.linuxfromscratch.org/blfs/view/7.4/x/makedepend.html"
license=('custom')
depends=('splint')
makedepends=('autoconf' 'automake' 'm4' 'make' 'pkg-config' 'xorg-util-macros')
source=(http://xorg.freedesktop.org/archive/individual/util/makedepend-1.0.5.tar.gz)
sha256sums=('503903d41fb5badb73cb70d7b3740c8b30fe1cc68c504d3b6a85e6644c4e5004')
conflicts=('imake')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/makedepend \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/makedepend \
    --localstatedir=/var/lib/makedepend \
    --with-lint
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/makedepend"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
