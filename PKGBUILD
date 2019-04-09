# Maintainer: Omar Roth <omarroth@hotmail.com>

pkgname=urbit
pkgver=0.7.2
pkgrel=1
pkgdesc="An operating function"
arch=('i686' 'x86_64')
url="https://urbit.org/"
license=('MIT')
depends=('libsigsegv' 'gmp' 'openssl' 'ncurses' 'curl' 'libuv' 'python')
makedepends=('gcc' 'automake' 'autoconf' 'ragel' 'cmake' 're2c' 'libtool' 'meson' 'ninja')
conflicts=('urbit-git')
source=($pkgname-$pkgver::git+https://github.com/urbit/urbit)
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  
  msg2 'Preparing distribution...'
  ./scripts/bootstrap
}

build() {
  cd "${pkgname}-${pkgver}"

  msg2 'Building...'
  ./scripts/build
}

package() {
  cd "${pkgname}-${pkgver}"

  msg2 'Installing license...'
  install -Dm644 LICENSE.txt -t "pkgdir/usr/share/licenses/urbit"

  msg2 'Installing...'
  install -Dm755 build/urbit ${pkgdir}/usr/bin/urbit
}
