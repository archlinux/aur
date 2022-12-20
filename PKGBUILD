# maintainer: lcsmueller
# contributor: mrtuxa<contact@mrtuxa.email>
pkgname=concord-git
pkgver=v2.2.0.r1.g38dc9b2e
pkgrel=1
pkgdesc="A Discord API wrapper library made in C"
arch=('any')
url="https://github.com/Cogmasters/concord"
license=('MIT')
depends=('curl')
makedepends=('git')
source=("$pkgname"::git+https://github.com/Cogmasters/concord.git#branch=dev)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd $pkgname
  PREFIX=$pkgdir/usr make install
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
