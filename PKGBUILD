# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: desbma

pkgname=zoxide-bin
_pkgname=zoxide
pkgver=0.7.2
pkgrel=1
pkgdesc='A fast cd command that learns your habits (binary release)'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/ajeetdsouza/zoxide"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
changelog=CHANGELOG.md
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-musl.tar.gz")
source_armv7h=("$_pkgname-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/$_pkgname-armv7-unknown-linux-musleabihf.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-musl.tar.gz")
sha512sums_x86_64=('adf6d2d79138be62f5a915db6319a293132fce205cf2d10ae06247eed4e12649833fd4331d78e022f6b8f5a3ebb4e6c25db1bdbcd1f3beb10f233a7aa30c4348')
sha512sums_armv7h=('615785e73175a6126e06ba3457f84ac8a6696f9438e6c2f18d444da5d62c865f75f5173f50834c0d7e8f4b6a4a7a1c3b16fc37905ec0e11ca060ea3fd0b478c0')
sha512sums_aarch64=('9b5d64b69d23897ff41056a5c51d9a4d030ed4f069d5babc6b2f54767b89f79e83a86e44636a7c828779536ed61338da13e833173515e27a2e301ad4f08eb9e8')

prepare() {
  if [[ "$CARCH" == 'armv7h' ]]
  then
    local _filename="$_pkgname-x86_64-unknown-linux-musl"
    test -d "$_filename" || mv "$_filename" "$_pkgname-$CARCH-unknown-linux-musl"
  fi
}

package() {
  cd "$_pkgname-$CARCH-unknown-linux-musl"
  install -Dm 755 zoxide -t "$pkgdir/usr/bin/"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  find man \
    -type f -exec install -Dm 644 '{}' -t "$pkgdir/usr/share/man/man1/" \;
}
