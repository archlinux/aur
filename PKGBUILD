# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Wesley Moore <wes@wezm.net>
# https://github.com/orhun/pkgbuilds

pkgname=verco
pkgver=6.5.5
pkgrel=1
pkgdesc="A simple Git/Mercurial/PlasticSCM tui client based on keyboard shortcuts"
arch=('x86_64')
url="https://github.com/vamolessa/verco"
license=('GPL3')
depends=('gcc-libs')
optdepends=('git: support for git repositories'
            'mercurial: support for mercurial repositories')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a09e15600de3b2abe7de0975bdb70f3aa76e07f8c0f898b519b8c4d8a9efb629298470f37f4d9fa8353da4c785f7aeda2c08cde83559ba47a05136bc35bcc52f')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
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
