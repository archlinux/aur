# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mkusb
pkgver=0.3.0
pkgrel=1
pkgdesc="A shell script to create ISO multiboot USB flash drives that support both legacy and EFI boot"
arch=('any')
url="https://github.com/lilyinstarlight/mkusb"
license=('MIT')
depends=('bash' 'dosfstools' 'grub')
optdepends=('dialog: required if not specifying device on command line'
            'syslinux: only required for FreeDOS')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ac4f66dc7e062cf8eb3500d990070bc32053087042e6118b53eb25a70e92aa56efbab205f0ed579e394fa191caa1f571967e6b7b4ef0e2d1ce841e201591baab')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|usr/local|usr|' makefile
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
