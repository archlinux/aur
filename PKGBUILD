# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.12.0
pkgrel=1
pkgdesc='Show CommonMark (a standardized Markdown dialect) documents on text terminals.'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('Apache')
depends=('oniguruma')
conflicts=('mdcat-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha512sums=('01d4a918362b64565ba165e418d854656c4ed53fc76a812e4bac3bc2d91df208b6103694167fee978a7b1e04e169c3c47a51620c854c8612e3b479879bd25d58')

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
