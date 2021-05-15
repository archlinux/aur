# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs-git
_pkgname=dotter
pkgver=0.12.3.r5.gfa016c9
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust (git)"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
makedepends=('rust' 'git')
conflicts=("$_pkgname" "${pkgname%-git}")
depends=('gcc-libs' 'openssl')
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cargo build --release --locked --features handlebars_misc_helpers
}

check() {
  cd "$_pkgname"
  cargo test --release --locked --features handlebars_misc_helpers
}

package() {
  cd "$_pkgname"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
