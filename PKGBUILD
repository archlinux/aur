# Maintainer: tstonge <tylertstonge@gmail.com>
pkgname=ampcast-bin
_pkgname=ampcast
pkgver=0.9.26
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
sha256sums=('f5d799bd2caa6e88137c1e9296e5ceb4ab5cb89a4e6950c2390040114f70695f'
            'edf448bc0aab63b192cc3c68716c00e325450b6251b52ea69f6d1be6eb235a95'
            'acc37987470ff53d106d8463aea5716affc6e99667f4c211831dcfc10dd90e51')

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
