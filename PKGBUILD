pkgname=wireguard-go
pkgver=0.0.20180613
pkgrel=1
pkgdesc="Go Implementation of WireGuard (not recommended by upstream, use official kernel module if possible)"
arch=('x86_64')
url="https://git.zx2c4.com/wireguard-go/"
license=('GPL2')
depends=('glibc')
makedepends=('go')
optdepends=('wireguard-tools: tools to configure WireGuard interfaces')
options=('!strip' '!emptydirs')
source=("https://git.zx2c4.com/$pkgname/snapshot/$pkgname-$pkgver.tar.xz"
        "00-enable-on-linux.diff")
sha256sums=('3e22e6f2a715f05f9bbc5b1a9c737ab2edc8f26b2af61f9cc31f83391cd663ff'
            'e3780098f682e06480baefae4e4a30b0b179f033cb4e1bca4346c61172c457d8')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p1 < "$srcdir"/00-enable-on-linux.diff
}

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
