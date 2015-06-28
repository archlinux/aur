# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=agentsmith
pkgver=0.2
pkgrel=1
pkgdesc="Monitor log files for break-in attempts"
arch=('i686' 'x86_64')
depends=('openssl' 'pcre')
makedepends=('gcc' 'make')
url="https://www.guengel.ch/myapps/agentsmith"
license=('GPL3')
source=(http://www.guengel.ch/myapps/agentsmith/downloads/$pkgname-$pkgver.tar.gz)
sha256sums=('38f56dbf017f6cb260c4abf55f422fe540e95a4058f589a88f6314183e1d8435')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 "Building..."
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/agentsmith \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/agentsmith \
    --localstatedir=/var/lib/agentsmith
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
