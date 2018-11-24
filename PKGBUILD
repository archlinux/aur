# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.11.0
pkgrel=1
pkgdesc='Show CommonMark (a standardized Markdown dialect) documents on text terminals.'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('Apache')
depends=('oniguruma')
conflicts=('mdcat-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha512sums=('b300ae90be74750de4bfdf2a04ef292b2b59569169957b2638b518dc1d47c0ce5adf3a8e6dfd7b67d0b2ba2b284d3fdb62e93fc208efa671165ebf979fef03a5')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  # Default features are iterm2 terminology and remote_resources. iterm2 is
  # unecessary on Arch, remote_resources brings in a chain of depenedencies
  # reqwest->native-tls->openssl. The version of the openssl crate that is
  # selected does not recognise the version that Arch is using and results in
  # the build failing so this feature is disabled.
  /usr/bin/cargo build --release --no-default-features --features terminology
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
