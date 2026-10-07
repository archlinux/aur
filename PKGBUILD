# Maintainer: ParticleG <particle_g@outlook.com>

pkgname=akagi-bin
pkgver=3.7.1
pkgrel=1
pkgdesc='Mahjong AI assistant for Majsoul, Tenhou, Riichi City, and Amatsuki (binary release)'
arch=('x86_64')
url='https://github.com/shinkuan/Akagi'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'gtk3' 'hicolor-icon-theme' 'webkit2gtk-4.1')
optdepends=('chromium: browser for Chromium capture mode')
provides=('akagi')
conflicts=('akagi')
options=('!strip' '!debug')

_tag="v$pkgver"
_archive="akagi-$pkgver-linux-x64"
source=(
  "$pkgname-$pkgver.zip::$url/releases/download/$_tag/$_archive.zip"
  "$pkgname-$pkgver.png::https://raw.githubusercontent.com/shinkuan/Akagi/$_tag/icons/128x128@2x.png"
  'akagi'
  'akagi.desktop'
)
sha256sums=(
  'e877478d766fca34dd53708c995785863681599b25bf9fb2e49511a1a5394f82'
  '8087dbf92eee0fdd0a9d47d69b2c4a1408f29e052dc1a0be48f31f00b0cd7a09'
  'c8c8424b5cf8d312dd5bc4d58a59fa8661f35a6578b3a3c18143cfe6384fff40'
  '22325ed20f35b87db18d58dfa290886d4f96567e4ca2925136d35f48d1b84eb2'
)

package() {
  install -d "$pkgdir/opt"
  cp -a "$srcdir/$_archive" "$pkgdir/opt/akagi"

  install -Dm755 "$srcdir/akagi" "$pkgdir/usr/bin/akagi"
  install -Dm644 "$srcdir/akagi.desktop" \
    "$pkgdir/usr/share/applications/akagi.desktop"
  install -Dm644 "$srcdir/$pkgname-$pkgver.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/akagi.png"
  install -Dm644 "$srcdir/$_archive/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_archive/NOTICE" \
    "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
