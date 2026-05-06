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
sha256sums=('b921122f335e0738565deb3cfee9f00132bb1443bc152448a82ab2a6f893ca5a')
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
