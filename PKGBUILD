pkgname=way-cooler-bg-git
pkgver=0.3.0.75.g9dde66b
pkgrel=1
pkgdesc="The program that draws a background for Way Cooler"
arch=('i686' 'x86_64')
url="https://github.com/way-cooler/way-cooler-bg"
license=('MIT')
depends=('way-cooler')
makedepends=('cargo' 'rust')
source=("${pkgname}::git+https://github.com/way-cooler/way-cooler-bg.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  install -D -m755 "$srcdir/$pkgname/target/release/wc-bg" "$pkgdir/usr/bin/wc-bg"
}
