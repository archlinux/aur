# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=sandboxctl
pkgver=1.0
pkgrel=1
pkgdesc="Automates the creation and management of chroot-based sandboxes"
arch=('any')
depends=('shtk')
makedepends=('autoconf' 'automake' 'make' 'pkg-config')
url="https://github.com/jmmv/sandboxctl"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://github.com/jmmv/$pkgname/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('4b404885c4a3a206eb31f620cf6c9a4bcece585bb134ebc7a8d6f06b7c1c5a59')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  #autoreconf -i -s
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/sandboxctl \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/sandboxctl \
    --localstatedir=/var/lib/sandboxctl
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/sandboxctl"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
  # mv "$pkgdir/usr/tests" "$pkgdir/usr/share/sandboxctl"
}
