# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=facron
pkgver=1.1
pkgrel=1
pkgdesc="Advanced filesystem cron based on fanotify"
arch=('i686' 'x86_64')
makedepends=('autoconf' 'gcc' 'make' 'pkg-config')
url="https://github.com/Keruspe/facron"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/Keruspe/$pkgname/tar.gz/v$pkgver)
sha256sums=('5392ae774386d57ded16548fcffb6fff0f1b3d4c747ba1b5fe4f497a6bfa3c39')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 "Building..."
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/facron \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/facron \
    --localstatedir=/var/lib/facron \
    --with-systemdsystemunitdir=/usr/lib/systemd/system
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
