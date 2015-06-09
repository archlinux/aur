# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrum-sync-server
pkgver=0.0.2
pkgrel=1
pkgdesc="Server component for the Bitcoin wallet Electrum's label synchronization feature"
arch=('i686' 'x86_64')
depends=('sqlite')
makedepends=('git' 'go')
url="https://github.com/maran/electrum-sync-server"
license=('Unknown')
options=('!strip' '!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/maran/$pkgname/tar.gz/$pkgver)
sha256sums=('b94415a9e00d6a7b8d71d63d19b96ba7170e4011a87af1220b54a8ab4a493b64')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  GOPATH="$srcdir" go get -u github.com/maran/electrum-sync-server
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  msg2 'Installing binaries...'
  for _bin in `find "$srcdir/bin" -mindepth 1 -maxdepth 1 -type f -printf '%f\n'`; do
    install -Dm 755 "$srcdir/bin/$_bin" "$pkgdir/usr/bin/$_bin"
  done
}
