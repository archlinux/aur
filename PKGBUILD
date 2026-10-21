# Maintainer: Martin Kopecký <kopecky@thekrew.app>
pkgname=spot-bin
pkgver=0.2.2
pkgrel=1
pkgdesc='TOML+CSS dialog runtime for Wayland (layer-shell overlays), prebuilt binary'
arch=('x86_64')
url='https://github.com/KopyTKG/spot'
license=('MIT')
depends=('glibc' 'gtk4' 'gtk4-layer-shell')
provides=('spot')
conflicts=('spot' 'spot-git')

_release="$url/releases/download/v$pkgver"
# The tagged source archive supplies LICENSE, README.md and examples/.
source=("spot-linux-x64-$pkgver::$_release/spot-linux-x64"
        "spot-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=("spot-linux-x64-$pkgver")
sha256sums=('69be31dc37fa989e74626746c82c2e9243b2592a1a71bdf4f9fb10bdf0800a5c'
            '576666f8169b0382f689d015085c93c3c6f8aa1cdd2897e99960872ab0dd9132')

package() {
  install -Dm755 "$srcdir/spot-linux-x64-$pkgver" "$pkgdir/usr/bin/spot"
  cd "$srcdir/spot-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/spot/README.md"
  # examples/ has a demo/ subdirectory, which `install -t ... examples/*` would refuse
  cp -r examples "$pkgdir/usr/share/doc/spot/"
  [ ! -d docs ] || cp -r docs "$pkgdir/usr/share/doc/spot/"   # absent before v0.2.1
}
