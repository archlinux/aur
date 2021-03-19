# Maintainer: lmartinez-mirror
pkgname=tai-git
pkgver=0.0.3.r0.g4db4c1f
pkgrel=1
pkgdesc="terminal ascii image -- convert images to ascii written in Rust"
arch=('x86_64')
url="https://github.com/MustafaSalih1993/tai"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('tai')
conflicts=('tai')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"
  cargo build --release --locked
}

check() {
  cd "$pkgname"
  cargo test --release --locked
}

package() {
  cd "$pkgname"
  install -Dm 755 target/release/tai -t "$pkgdir/usr/bin/"
  install -Dm 444 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 444 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
