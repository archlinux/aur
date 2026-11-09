# Maintainer: Chris <goabonga@pm.me>

pkgname=bluetooth-gpd
pkgver=0.1.0
pkgrel=1
pkgdesc='Linux Bluetooth manager with a daemon, a terminal interface, SBC audio and an ALSA plugin'
arch=('x86_64')
url='https://github.com/goabonga/bluetooth-gpd'
license=('MIT')
depends=('alsa-lib'
         'ctui'
         'glibc'
         'ncurses'
         'sbc')
makedepends=('pkgconf')
options=('!debug')
install=bluetooth-gpd.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1dbf76a50fe4e710f424cb4b82c922a3d41415edfb8f85d571038297710b7abe')

build() {
  cd "$pkgname-$pkgver"
  make WERROR= PREFIX=/usr
}

check() {
  cd "$pkgname-$pkgver"
  # -Werror and the sanitizers are development options of upstream: a new compiler
  # warning must not break the package
  make WERROR= SANITIZE= test
}

package() {
  cd "$pkgname-$pkgver"
  make WERROR= DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
