# Maintainer: vlensys (contact me on github for wtv reason)
pkgname=lyricspot
pkgver=1.2.0
pkgrel=1
pkgdesc="Live synced lyrics in your terminal, pulled from Spotify or any MPRIS player"
arch=('any')
url="https://github.com/vlensys/lyricspot"
license=('MIT')
depends=('python' 'python-spotipy' 'playerctl')
optdepends=('python-pillow: for dynamic album art colors')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vlensys/lyricspot/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ac128d1c8f32c117cfd16b66e555cce1ae863ffb8097919e183f62f93355a03e')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 lyricspot.py "$pkgdir/usr/lib/lyricspot/lyricspot.py"
  install -Dm644 colorthief.py "$pkgdir/usr/lib/lyricspot/colorthief.py"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/lyricspot" <<'LAUNCHER'
#!/bin/bash
exec python /usr/lib/lyricspot/lyricspot.py "$@"
LAUNCHER
}
