# Maintainer:  Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=screen-selector-git
pkgver=0.1.1.r0.ga2f5263
pkgrel=1
pkgdesc='Unity plugin replacing the proprietary ScreenSelector.so, using GTK 4'
arch=('x86_64' 'aarch64')
url='https://linkmauve.fr/dev/screen-selector/'
license=('GPL3')
depends=('gtk4')
makedepends=('cargo')
conflicts=('screen-selector')
provides=('screen-selector' 'ScreenSelector.so')
source=("git+https://git.linkmauve.fr/screen-selector.git")
sha256sums=('SKIP')
install=screen-selector.install

pkgver() {
  cd screen-selector
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd screen-selector
  cargo build --release
}

package() {
  cd screen-selector
  install -Dm755 target/release/libscreen_selector.so "$pkgdir"/usr/lib/ScreenSelector.so
}
