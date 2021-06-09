# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: desbma

pkgname=zoxide-bin
_pkgname=zoxide
pkgver=0.7.1
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
sha512sums_x86_64=('72809c8e65e3f6155e1bfaf068e8571d6caea6d17db54432477c1847391ee0fd1bf08d1a70b176b47e2d728bc2eda3cf25cc219251e26e631a9beae0abad8ce5')
sha512sums_armv7h=('95227428a4f49068159fc960b4924b4e6aed31f53346665f23129e439afd46f974cd57ecf3ae9e918c57e02f6d8d25edf448a76992b8a07e9a3d2e7c233fca82')
sha512sums_aarch64=('a1a3ff5416d70c1b6a71a08313ff9203087a6c8b266a9f78e73ad24c77b97ffb7938027f711e769628ce35cd69d12012655420603ef69d3d201cacbf769de135')

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
