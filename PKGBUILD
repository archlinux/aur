# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Wesley Moore <wes@wezm.net>
# https://github.com/orhun/pkgbuilds

pkgname=verco
pkgver=6.8.0
pkgrel=1
pkgdesc="A simple Git/Mercurial/PlasticSCM tui client based on keyboard shortcuts"
arch=('x86_64')
url="https://github.com/vamolessa/verco"
license=('GPL3')
depends=('gcc-libs')
optdepends=('git: support for git repositories'
            'mercurial: support for mercurial repositories')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2ec1d6ea441e42f97c95fd7d1d67478962f28b2abcd106158dd062d960ddab711efd6d9dfffeac43d4e245bf5373c0a301702940805d6dbc3e4d69792de1a3d2')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
