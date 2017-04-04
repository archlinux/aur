# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=urbit-git
pkgver=0.4.r100.g83d0f8871
pkgrel=1
pkgdesc="An Operating Function"
url="http://www.urbit.org"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libsigsegv' 'libuv' 'curl')
makedepends=('git' 'cmake' 'python' 'ragel' 're2c')
conflicts=('urbit')
provides=('urbit')
options=('!makeflags')
source=('git+https://github.com/urbit/urbit.git')
sha1sums=('SKIP')

pkgver() {
  cd ${pkgname/-git}
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname/-git}
  make
}

package() {
  cd ${pkgname/-git}
  install -Dm755 bin/urbit "$pkgdir"/usr/bin/urbit
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
