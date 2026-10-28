# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=lynx-share-bin
pkgver=0.1.19alpha
pkgrel=1
pkgdesc='A lightweight DAW with the FL Studio workflow (prebuilt binaries)'
arch=('x86_64')
url='https://github.com/Ka1-S/LYNX'
license=('AGPL-3.0-only')
depends=('glibc>=2.35' 'alsa-lib' 'fontconfig' 'freetype2'
         'libx11' 'libxext' 'libxinerama' 'libxrandr' 'libxcursor'
         'libxcomposite' 'libxrender' 'libxi' 'libglvnd'
         'hicolor-icon-theme' 'shared-mime-info')
optdepends=('pipewire: native PipeWire audio driver'
            'jack: JACK audio driver'
            'rtkit: real-time audio scheduling without root'
            'xorg-xwayland: run on Wayland desktops')
provides=('lynx-share')
conflicts=('lynx-share')
options=(!strip !debug)

_tag=v0.1.19-alpha
_upstreamver="${_tag#v}"
source=("$url/releases/download/$_tag/LYNX-$_upstreamver-linux-x86_64.tar.gz")
sha256sums=('2ff52860d3ab264d376bd8a808b5f6c0524720c91e026e82ede9c9eee126ee2c')

package() {
  cd "$srcdir/LYNX-$_upstreamver-linux-x86_64"

  install -d "$pkgdir/usr/lib/lynx-share" "$pkgdir/usr/bin"
  cp -a --no-preserve=ownership . "$pkgdir/usr/lib/lynx-share/"
  ln -s /usr/lib/lynx-share/LYNX "$pkgdir/usr/bin/LYNX"

  install -Dm644 lynx.desktop "$pkgdir/usr/share/applications/lynx-share.desktop"
  sed -i 's/^Icon=lynx$/Icon=lynx-share/' "$pkgdir/usr/share/applications/lynx-share.desktop"
  install -Dm644 lynx.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/lynx-share.png"
  install -Dm644 lynx-mime.xml "$pkgdir/usr/share/mime/packages/lynx-share.xml"
  sed -i 's/name="lynx"/name="lynx-share"/' "$pkgdir/usr/share/mime/packages/lynx-share.xml"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY.md"
  install -Dm644 PRIVACY.md "$pkgdir/usr/share/doc/$pkgname/PRIVACY.md"
}
