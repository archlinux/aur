# Maintainer: adenast <adenast@proton.me>
pkgname=footfetch-git
_pkgname=footfetch
pkgver=1.42.4.r0.g1234567
pkgrel=1
pkgdesc="A neofetch-like tool for those who prefer feet over faces"
arch=('x86_64' 'aarch64')
url="https://github.com/adenast/footfetch"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

check() {
  cd "$_pkgname"
  cargo test --release --locked
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}