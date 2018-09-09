# Maintainer: futpib <futpib@gmail.com>
# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=urbit-git
pkgver=0.6.0.r11.gd7a9744ce
pkgrel=1
pkgdesc="An Operating Function"
url="http://www.urbit.org"
arch=('i686' 'x86_64')
license=('MIT')
depends=(libsigsegv libuv libtool curl openssl)
makedepends=(autoconf automake cmake gcc git gmp ncurses ninja python ragel re2c meson)
conflicts=('urbit')
provides=('urbit')
options=('!makeflags')
source=('git+https://github.com/urbit/urbit.git')
sha1sums=('SKIP')

pkgver() {
  cd ${pkgname/-git}
  git describe --long --tags | sed 's/^urbit-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname/-git}
  ./scripts/bootstrap
  ./scripts/build
}

package() {
  cd ${pkgname/-git}
  install -Dm755 build/urbit "$pkgdir"/usr/bin/urbit
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
