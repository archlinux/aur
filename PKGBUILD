# Maintainer: lmartinez-mirror
# Contributor: donbex <ap dot m at runbox dot com>
pkgname=as-tree-git
_pkgname=${pkgname%-git}
pkgver=0.12.0.r6.g0036c20
pkgrel=1
pkgdesc="Print a list of paths as a tree of paths"
arch=('x86_64')
url="https://github.com/jez/as-tree"
license=('custom:BOML')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver()  {
  cd "$_pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  cd "$_pkgname"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$_pkgname"
  install -Dm 755 target/release/$_pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
