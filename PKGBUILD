# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

pkgname=ketchup-bin
_pkgname=ketchup
pkgver=0.1.0
pkgrel=4
pkgdesc='a pomodoro timer using client <-> server architecture'
arch=(x86_64)
url='https://github.com/jreinert/ketchup'
license=('MIT')
depends=(gc libevent gcc-libs-multilib pcre libyaml)
makedepends=(perl)

source=(
  "https://github.com/jreinert/$_pkgname/archive/$pkgver.tar.gz"
  "https://github.com/jreinert/$_pkgname/releases/download/$pkgver/ketchup"{,.sig}
  "https://github.com/jreinert/$_pkgname/releases/download/$pkgver/ketchup-server"{,.sig}
)
validpgpkeys=('26DCD9B1C4192A20C856D3A04D9F310E17204540')
sha512sums=(
  7e15514281e9f31ce15f4c1e2888927069711e04253a188e6ac211a2eb61097dcadbe6e25d319111a4adceae6f0b1da5ec302ec4af512b24fd500ada3e8bbaa2
  SKIP
  SKIP
  SKIP
  SKIP
 )
provides=('ketchup')
conflicts=('ketchup-git')

build() {
  sed -i "s/^\(VERSION\s*=\).*/\1 $pkgver/" $_pkgname-$pkgver/Makefile
  make -C "$_pkgname-$pkgver" doc
  cp ketchup ketchup-server "$_pkgname-$pkgver"
}

package() {
  make -C "$_pkgname-$pkgver" PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
