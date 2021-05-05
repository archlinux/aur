# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: desbma

pkgname=zoxide-bin
_pkgname=zoxide
pkgver=0.7.0
pkgrel=1
pkgdesc='A fast cd command that learns your habits (binary release)'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/ajeetdsouza/zoxide"
license=('MIT')
depends=('gcc-libs')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-musl.tar.gz")
source_armv7h=("$_pkgname-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/$_pkgname-armv7-unknown-linux-musleabihf.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-musl.tar.gz")
sha512sums_x86_64=('fbe1d24f1996575836552243ecc27734fca31e04aeb7ba31a9e17bdc3c0cfa7754cde4f361e4ef3e9e5fa568ff9c8d4411b58a4dae4e5df9a9c30fab04e9e9c7')
sha512sums_armv7h=('157ee53127e3a6d06a6ee6b8816bfaee588a48e7b87e6db1df8f6361918f5a538c6429ec6de8f472926fdb409add10b8917325e86cbf1d0bd5492b3a7fe548e3')
sha512sums_aarch64=('97dfe8909e473130339138ccd1f3ac80965bd9f5f86b27b1c3c55f13ba72992da08df81978d4e52314527a2c961bd494cc0a7abbff9df8198b72c9836931c239')

prepare() {
  if [[ "$CARCH" == 'armv7h' ]]
  then
    test -d "$_pkgname-$CARCH-unknown-linux-musl" || mv "$_pkgname-armv7-unknown-linux-musleabihf" "$_pkgname-$CARCH-unknown-linux-musl"
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
