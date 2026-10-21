# Maintainer: Martin Kopecký <kopecky@thekrew.app>
pkgname=spot-bin
pkgver=0.2.0
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
sha256sums=('2da3946b21a06d4c7ab3cc02a77410e6739dc77ecca3031bb19fce06412f46c1'
            '662ed1fd34b93727558364d20bafce7758f1901dcf4b52a987f3d7236602e415')

package() {
  install -Dm755 "$srcdir/spot-linux-x64-$pkgver" "$pkgdir/usr/bin/spot"
  cd "$srcdir/spot-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/spot/README.md"
  install -Dm644 -t "$pkgdir/usr/share/doc/spot/examples" examples/*
}
