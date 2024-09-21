# Maintainer: ArcanusNEO <admin@transcliff.top>
pkgname=see-git
pkgver=r59.b4dd0d2
pkgrel=1
pkgdesc="Simple and fast Web server."
arch=("any")
url="https://github.com/wyhaya/see"
license=("MIT")
depends=("base-devel" "git")
makedepends=("rust")
options=('!lto')
provides=("see")
conflicts=("see")
source=("$pkgname::git+$url")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname/target/release/see" "$pkgdir/usr/bin/see"
}
