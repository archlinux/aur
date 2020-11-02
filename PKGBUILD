# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Wesley Moore <wes@wezm.net>
# https://github.com/orhun/pkgbuilds

pkgname=verco
pkgver=5.5.1
pkgrel=1
pkgdesc="Simple Git/Hg tui client focused on keyboard shortcuts"
arch=('x86_64')
url="https://github.com/matheuslessarodrigues/verco"
license=('MIT')
optdepends=('git: support for git repositories'
            'mercurial: support for mercurial repositories')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('81e5d071b48035c6b3ef9a01478e94a043ef79cf13711331396c85f7a6d529d4d49119ccb5317a124838db41928684f3e71db7ff7b1a303a8776a09e6df5e560')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
