# Maintainer: Roey Darwish Dror <roey.ghost@gmail.com>

pkgname=alma
pkgver=0.9.0
pkgrel=1
pkgdesc='Create Arch Linux based live USB'
arch=('x86_64')
url='https://github.com/r-darwish/alma'
license=('GPL3')
makedepends=('rust')
depends=('gptfdisk' 'parted' 'arch-install-scripts' 'dosfstools' 'coreutils' 'util-linux')
optdepends=('cryptsetup: for root filesystem encryption')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1721b464901ff373b8b7b7ea68989685c52e7167266a6ca35526972b741937d0')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
