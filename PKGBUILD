# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=dotool
pkgver=1.0
pkgrel=1
pkgdesc="Command to simulate input anywhere"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~geb/dotool"
license=('')
makedepends=('go>=1.19')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('b73097f0c7be22e318e8ee446aed8291693a7198d335a82ca624a5887fe8d16d')
sha512sums=('d0df2b0143819782986acddcfdf339fda49a788e13c5822ec8393766f32d6d88e34b88c0bc8ea2254b2fad90963c469fe20efe9d6453dae5c8cde8bf4b92cd2d')

build() {
  cd "$pkgname-$pkgver"

  go build
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc/udev/rules.d"
  install dotool dotoolc dotoold "$pkgdir/usr/bin/"
  install 80-dotool.rules "$pkgdir/etc/udev/rules.d"
  sudo udevadm trigger
}

