# Maintainer: Shyam Jagath <shyam.gaming.here@gmail.com>

pkgname=keysound
pkgver=0.9.0
pkgrel=1
pkgdesc="Wayland-compatible mechanical keyboard sound daemon"
arch=('x86_64')
url="https://github.com/Shyam-Jagath/keysound"
license=('MIT')
depends=('libevdev' 'systemd' 'miniaudio')
makedepends=('clang' 'make')
source=("https://github.com/Shyam-Jagath/keysound/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('07b8d6cf61db0cce7d89e8ece3fa564b581d2e665fa6d5eb39a60927d6dbd90f')
install='keysound.install'

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
  
  if [ -d "soundpacks" ]; then
      install -d "$pkgdir/usr/share/keysound"
      cp -r "soundpacks" "$pkgdir/usr/share/keysound/"
  fi
}
