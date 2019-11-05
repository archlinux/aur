# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=git-brws
pkgver=0.11.3
pkgrel=1
pkgdesc='CLI tool to open repository URLs for GitHub, BitBucket and GitLab in your browser'
arch=('x86_64')
url="https://github.com/rhysd/git-brws"
license=('MIT')
depends=()
conflicts=('git-brws-git')
makedepends=('rust' 'cargo')
source=("$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9d0a2d700bf4ddef1ebd242692452d006a1b62e72b63b34818ca20b68eb16c0a')

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
