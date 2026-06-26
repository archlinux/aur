# Maintainer: Haram Choi <altitudinem at google dot com>
pkgname=linux-fireface-mixer
pkgver=0.2.0
pkgrel=1
pkgdesc="GUI mixer application for RME Fireface 400 on Linux"
arch=('x86_64')
url="https://github.com/oudeis01/linux-fireface-mixer"
license=('GPL3')
depends=('alsa-lib' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi' 'systemd-libs' 'liblo' 'snd-firewire-ctl-services')
makedepends=('cmake')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4e84c8e64294b8162e99b7db894f36ac85ff93c1928b0c84e8c3ce6af1733f9d')

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  
  install -Dm755 totalmixer_gui "$pkgdir/usr/bin/totalmixer_gui"
  install -Dm755 totalmixer_cli "$pkgdir/usr/bin/totalmixer_cli"
  
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" \
      "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README-kr.md" \
      "$pkgdir/usr/share/doc/$pkgname/README-kr.md"
}
