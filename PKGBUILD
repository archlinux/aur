# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.12.1
pkgrel=1
pkgdesc='Show CommonMark (a standardized Markdown dialect) documents on text terminals.'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('Apache')
depends=('oniguruma')
conflicts=('mdcat-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha512sums=('654ee4b1e1604eff14d93914aadf244c6cbce1a71d3a6560cf2d144bda839aa541de06ee1f86be8c22d75eefaff44272e005cd42dc29fa78be654fbf8557992a')

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
