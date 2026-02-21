# Maintainer: tstonge <tylertstonge@gmail.com>
pkgname=ampcast-bin
_pkgname=ampcast
pkgver=0.9.24
pkgrel=1
pkgdesc="A music player inspired by Winamp."
arch=('x86_64')
url="https://github.com/rekkyrosso/ampcast"
license=('GPL-3.0-only')
depends=(
  'gtk3'
  'nspr'
  'nss'
  'alsa-lib'
  'libx11'
)
provides=("ampcast")
options=(!strip !debug)
source=(
  "https://github.com/rekkyrosso/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x64.tar.xz" 
  "ampcast256x256.png"
  "ampcast.desktop"
)
sha256sums=(
  "4a47394f2dad9efe051d3371d6c70f999ad2fd590e74ea51a18a6fd1f799e4dd"
  "SKIP"
  "SKIP"
)

package() {
  install -d "$pkgdir/opt"
  cp -r "$srcdir/$_pkgname-$pkgver-linux-x64/" "$pkgdir/opt/$_pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/$_pkgname-app" "$pkgdir/usr/bin/$_pkgname-app"

  install -d "$pkgdir/usr/share/licenses/$_pkgname"
  install -m644 "$srcdir/$_pkgname-$pkgver-linux-x64/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$_pkgname/"
  install -m644 "$srcdir/$_pkgname-$pkgver-linux-x64/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$_pkgname/"

  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -m644 "ampcast256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/ampcast.png"

  install -d "$pkgdir/usr/share/applications"
  install -m644 "ampcast.desktop" "$pkgdir/usr/share/applications/ampcast.desktop"
}
