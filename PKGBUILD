# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Severin Glöckner <severin.gloeckner@imn.htwk-leipzig.de>

pkgname=gti
pkgver=1.9.1
pkgrel=1
pkgdesc="A silly git launcher"
arch=('x86_64')
url="https://r-wos.org/hacks/gti"
license=('custom')
depends=('git')
source=("https://github.com/rwos/gti/archive/v$pkgver.tar.gz")
sha256sums=('f8a3afdd3967fe7d88bd1b0b9f5cb62ae04dc9ba458238da91efc213f61a9cf9')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed '/Copyright/,$! d' README.md > "$srcdir"/LICENSE
  sed -i "s/=install/=install -D/" Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
