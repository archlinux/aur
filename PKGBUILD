# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Severin Glöckner <severin.gloeckner@imn.htwk-leipzig.de>

pkgname=gti
pkgver=1.8.0
pkgrel=1
pkgdesc="A silly git launcher"
arch=('x86_64')
url="https://r-wos.org/hacks/gti"
license=('custom')
depends=('git')
source=("https://github.com/rwos/gti/archive/v$pkgver.tar.gz")
sha256sums=('65339ee1d52dede5e862b30582b2adf8aff2113cd6b5ece91775e1510b24ffb9')

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
