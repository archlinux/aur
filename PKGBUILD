# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=git-brws
pkgver=0.11.8
pkgrel=1
pkgdesc='CLI tool to open repository URLs for GitHub, BitBucket and GitLab in your browser'
arch=('x86_64')
url="https://github.com/rhysd/git-brws"
license=('MIT')
depends=('openssl')
conflicts=('git-brws-git')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e3555fd14193585912253cadaf82f74924688a56dc7fe3ea0582320d8785fe6e')

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
