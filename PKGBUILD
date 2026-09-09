# Maintainer: Alper Ortac <alportac@gmail.com>
pkgname=ghostex-bin
pkgver=9.0.0
pkgrel=1
pkgdesc='Native AI agent workspaces with terminals and an embedded browser (prebuilt)'
arch=('x86_64')
url='https://github.com/maddada/Ghostex'
license=('MIT')
depends=(
  'bash' 'glibc' 'libgcc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11'
  'gtk3' 'nss' 'nspr' 'mesa' 'alsa-lib' 'at-spi2-core' 'libcups'
  'libdrm' 'libxcomposite' 'libxdamage' 'libxrandr' 'libxshmfence'
  'pango' 'cairo' 'fontconfig' 'wmctrl' 'hicolor-icon-theme'
)
provides=("ghostex=$pkgver")
conflicts=('ghostex')
options=('!strip' '!debug')
source=("ghostex-${pkgver}-linux-x64.tar.zst::$url/releases/download/v${pkgver}/ghostex-${pkgver}-linux-x64.tar.zst"
        "ghostex-${pkgver}-LICENSE::https://raw.githubusercontent.com/maddada/Ghostex/v${pkgver}/LICENSE")
sha256sums=('445b976df7c2cfeea0476acfae9aeacb00b47eada317d66a5436baa207cba557'
            '50c3e6ee30c68e93ebed3e549770999eaee10b88618588d57c9d5355d0996509')

package() {
  install -d "$pkgdir/opt" "$pkgdir/usr/bin"
  cp -a "$srcdir/opt/ghostex" "$pkgdir/opt/"
  install -Dm755 "$srcdir/usr/bin/ghostex" "$pkgdir/usr/bin/ghostex"
  ln -s ghostex "$pkgdir/usr/bin/gx"
  install -Dm644 "$srcdir/usr/share/applications/ghostex.desktop" \
    "$pkgdir/usr/share/applications/ghostex.desktop"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/256x256/apps/ghostex.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/ghostex.png"
  install -Dm644 "$srcdir/ghostex-${pkgver}-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
