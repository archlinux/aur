# Maintainer: Roey Darwish Dror <roey.ghost@gmail.com>

pkgname=alma
pkgver=0.4.0
pkgrel=1
pkgdesc='Create Arch Linux based live USB'
arch=('x86_64')
url='https://github.com/r-darwish/alma'
license=('GPL3')
makedepends=('rust')
depends=('gptfdisk' 'parted' 'arch-install-scripts' 'dosfstools' 'coreutils' 'util-linux')
optdepends=('cryptsetup: for root filesystem encryption')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4b920bd856b5180a2cfb01651fd97b109fe5d4cd2a8ca07f40863ca43c5da3bc')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
