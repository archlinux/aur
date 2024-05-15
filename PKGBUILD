# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=jirust
pkgver=1.1.7
pkgrel=1
pkgdesc="Jira terminal UI"
arch=('x86_64')
url="https://github.com/Code-Militia/jirust"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d9c7b219b467a5c605da1d68469ea2eecad391d3ae01fbf7f147fb525fd48bc7596b966a6b75971f79f8c96e15d0658f7f0a3f2428d6a0415503df61db1c6e37')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
