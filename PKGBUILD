# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mkusb
pkgver=0.3.1
pkgrel=1
pkgdesc="A shell script to create ISO multiboot USB flash drives that support both legacy and EFI boot"
arch=('any')
url="https://github.com/lilyinstarlight/mkusb"
license=('MIT')
depends=('bash' 'dosfstools' 'grub')
optdepends=('dialog: required if not specifying device on command line'
            'syslinux: only required for FreeDOS')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('578ca1157090dad73ed803f65f88983e5d6f77fca9491428d9c7dccc00e48cb021a3c87c52ff0f7740e4b9e5bc61e20978845bd8b92de2b969d763f4eacd839b')

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
