# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Severin Glöckner <severin.gloeckner@imn.htwk-leipzig.de>

pkgname=gti
pkgver=1.7.0
pkgrel=1
pkgdesc="A silly git launcher"
arch=('x86_64')
url="https://r-wos.org/hacks/gti"
license=('custom')
source=("https://github.com/rwos/gti/archive/v$pkgver.tar.gz")
sha512sums=('7a176a36dfa73f2da1ba624bc7a721445112d7c87cf3442ba38e051c32d4d983f462f61feb797db25c575af4fde0daa402e2ebc78df81336b09c2904cdb0ca8a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed '/Copyright/,$! d' README.md > "$srcdir"/LICENSE
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
