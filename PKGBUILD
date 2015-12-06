# Maintainer: Sam Stuewe <halosghost at archlinux dot info>

pkgname=hashcat
pkgver=2.00
pkgrel=1
pkgdesc='A multithreaded cross platform hash cracker.'
arch=('i686' 'x86_64')
url='https://hashcat.net/hashcat'
depends=('gmp')
license=('MIT')
source=("https://codeload.github.com/$pkgname/$pkgname/tar.gz/$pkgver")
md5sums=('492475e114bb6690afce2f66fe97e058')

build() {
  cd "$pkgname-$pkgver"

  [[ "$CARCH" == 'i686' ]] && make posix32 || make posix64
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir"/{usr/share/{doc,licenses},etc}/"$pkgname"
  [[ "$CARCH" == 'i686' ]] && _bin=hashcat-cli32.bin || _bin=hashcat-cli64.bin
  install -Dm755 "$_bin" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 docs/license.txt "$pkgdir/usr/share/licenses/hashcat/license.txt"

  cp -a --no-preserve=ownership {rules,salts,tables} "$pkgdir"/etc/"$pkgname"/
  cp -a --no-preserve=ownership examples "$pkgdir"/usr/share/doc/"$pkgname"/
}

# vim:set ts=2 sw=2 et:
