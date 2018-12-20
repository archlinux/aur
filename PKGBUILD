# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wireguard-module
pkgver=0.0.20181218
pkgrel=1
pkgdesc="Fast, modern, secure VPN tunnel (kernel module)"
arch=('i686' 'x86_64')
url="https://www.wireguard.com/"
license=('GPL')
depends=('linux>=3.10')
makedepends=('linux-headers>=3.10' 'xz')
provides=('WIREGUARD-MODULE')
conflicts=('WIREGUARD-MODULE')
source=("https://git.zx2c4.com/WireGuard/snapshot/WireGuard-$pkgver.tar"{.xz,.asc})
sha256sums=('2e9f86acefa49dbfb7fa6f5e10d543f1885a2d5460cd5e102696901107675735'
            'SKIP')
validpgpkeys=('AB9942E6D4A4CFC3412620A749FC7012A5DE03AE')  # Jason A. Donenfeld <Jason@zx2c4.com>


_extramodules=extramodules-ARCH

build() {
  cd "WireGuard-$pkgver/src"

  make module
}

package() {
  cd "WireGuard-$pkgver/src"

  find './' -name '*.ko' -exec xz -0 --force {} \;
  install -Dm644 "wireguard.ko.xz" "$pkgdir/usr/lib/modules/$_extramodules/wireguard.ko.xz"
}
