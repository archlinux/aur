# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=mkusb
pkgver=0.2.4
pkgrel=1
pkgdesc="A shell script to create ISO multiboot USB flash drives that support both legacy and EFI boot"
arch=('any')
url="https://github.com/lilyinstarlight/mkusb"
license=('MIT')
depends=('bash' 'dosfstools' 'grub')
optdepends=('dialog: required if not specifying device on command line'
            'syslinux: only required for FreeDOS')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c3fd9bb258dee27820d6a38dd4766db2442bcb5a2e39507e9b061f3dd011558a')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|usr/local|usr|' makefile
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
