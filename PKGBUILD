# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=git-brws
pkgver=0.11.5
pkgrel=1
pkgdesc='CLI tool to open repository URLs for GitHub, BitBucket and GitLab in your browser'
arch=('x86_64')
url="https://github.com/rhysd/git-brws"
license=('MIT')
depends=()
conflicts=('git-brws-git')
makedepends=('rust' 'cargo')
source=("$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('23f6b676df6d8a65cc9bef03e95daa2a5a10ae381fd313892db7fae77b60cef7')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
