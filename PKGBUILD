# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=paexec
pkgver=1.1.4
pkgrel=1
pkgdesc="Parallel executor, distributes tasks over network or CPUs"
arch=('i686' 'x86_64')
depends=('runawk')
makedepends=('bmake' 'libmaa' 'mk-configure' 'clang')
url="https://github.com/cheusov/paexec"
license=('MIT')
source=("https://github.com/cheusov/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('e0ad09598e6824e6a06f52a84c2646320b01757db757c06d340ebdbfc078d956')

build() {
  cd $pkgname-$pkgname-$pkgver

  msg2 'Building...'
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man CC=clang
  export SUBPRJ_DFLT='paexec doc examples'
  mkc_compiler_settings
  mkcmake all
}

check() {
  cd $pkgname-$pkgname-$pkgver

  msg2 'Testing...'
  mkcmake test
}

package() {
  cd $pkgname-$pkgname-$pkgver

  msg2 'Installing...'
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  export SUBPRJ_DFLT='paexec doc examples'
  mkcmake DESTDIR="$pkgdir" install
}
