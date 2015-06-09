# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=paexec
pkgver=1.0.1
pkgrel=1
pkgdesc="Parallel executor, distributes tasks over network or CPUs"
arch=('i686' 'x86_64')
depends=('runawk')
makedepends=('bmake' 'libmaa' 'mk-configure')
url="https://github.com/cheusov/paexec"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/cheusov/$pkgname/tar.gz/$pkgname-$pkgver)
sha256sums=('281924cf1a1f01a5e0bf0c61037ef0f5487c7f2e516c4905c17b6a5da6d7814d')

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  msg 'Building...'
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  export SUBPRJ_DFLT='paexec doc examples'
  mkcmake all
}

check() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  msg 'Testing...'
  mkcmake test
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  msg 'Installing...'
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  export SUBPRJ_DFLT='paexec doc examples'
  mkcmake DESTDIR="$pkgdir" install
}
