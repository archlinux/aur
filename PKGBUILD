# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=flex-git
pkgver=2.6.4.r89.gd3de49f
pkgrel=1
epoch=1
pkgdesc="A tool for generating text-scanning programs - from git"
arch=('i686' 'x86_64')
url="https://github.com/westes/flex"
license=('custom')
conflicts=('flex')
provides=('flex')
depends=('glibc' 'm4' 'sh')
makedepends=('help2man' 'git')
source=('git+https://github.com/westes/flex.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  echo $(git describe --tags|sed 's+-+.r+' | tr - .|cut -c2-)
}

build() {
  cd ${pkgname%-git}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname%-git}
  make check
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
  ln -s flex "$pkgdir"/usr/bin/lex
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}

