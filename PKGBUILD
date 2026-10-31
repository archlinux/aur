# Maintainer: Radhey Kalra <radheykalra901@gmail.com>
pkgname=boxbox-bin
pkgver=0.3.2
pkgrel=1
pkgdesc='Desktop file manager for local files and self-hosted BoxBox servers'
arch=('x86_64')
url='https://github.com/jR4dh3y/BoxBox'
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'librsvg'
         'xdg-utils' 'nss' 'alsa-lib' 'libcups' 'libxcomposite' 'libxdamage'
         'libxrandr' 'libxkbcommon' 'mesa')
optdepends=('wl-clipboard: Wayland file clipboard'
            'xclip: X11 file clipboard'
            'python-gobject: interoperable file cut and copy'
            'gtk4: interoperable file cut and copy'
            'ffmpeg: video and audio thumbnails'
            'poppler: PDF thumbnails')
provides=('boxbox')
conflicts=('boxbox')
options=('!strip' '!debug')
_archive_sha256=00123b7286f07b48fcc73f024d1c84ce6057c555ecc97400446ee451d552a19d
source=("$url/releases/download/v$pkgver/boxbox-desktop-v$pkgver-linux-amd64.tar.gz"
        'AppRun' 'boxbox.desktop' 'boxbox.svg')
sha256sums=("$_archive_sha256"
            '3ffde00675a52d6f495fdff0ed18f6c032b549a7f8d91ddcf957a5d11507057b'
            'db028c3b873f6b25c3c794508b87b860b4afd4289b277f40c17666e3937497b3'
            'c0ed7b2cb1de5e4dc74cf01d60ef429ac6067b3cb2a9c33781240173e47cc96d')

package() {
  local bundle="boxbox-desktop-v$pkgver-linux-amd64"
  install -dm755 "$pkgdir/usr/lib/boxbox"
  cp -a "$srcdir/$bundle/BoxBox" "$pkgdir/usr/lib/boxbox/BoxBox"
  install -Dm755 AppRun "$pkgdir/usr/lib/boxbox/AppRun"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/lib/boxbox/AppRun "$pkgdir/usr/bin/boxbox"
  install -Dm644 boxbox.desktop "$pkgdir/usr/share/applications/io.boxbox.desktop"
  install -Dm644 boxbox.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.boxbox.desktop.svg"
  install -Dm644 "$srcdir/$bundle/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
