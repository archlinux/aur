# Maintainer: mrfrok
pkgname=anirust-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='Desktop client for Anixart with an mpv player (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/mrFrok/AniRust'
license=('GPL-3.0-or-later')
depends=('mpv' 'gcc-libs' 'fontconfig' 'ffmpeg' 'libxkbcommon' 'libxkbcommon-x11'
         'libxcursor' 'libxi' 'libxrandr' 'wayland' 'libglvnd')
optdepends=('xdg-desktop-portal: desktop file chooser'
            'gnome-keyring: store the Anixart session token'
            'vapoursynth: frame generation on x86_64')
provides=("anirust=$pkgver")
conflicts=('anirust')
options=('!strip' '!debug')

_app_id=io.github.mrfrok.AniRust
source=("https://raw.githubusercontent.com/mrFrok/AniRust/v$pkgver/packaging/linux/$_app_id.desktop"
        "https://raw.githubusercontent.com/mrFrok/AniRust/v$pkgver/packaging/linux/$_app_id.metainfo.xml")
source_x86_64=("$url/releases/download/v$pkgver/anirust-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/anirust-$pkgver-linux-aarch64.tar.gz")
sha256sums=('5ec162600363123a4fa2b624308b4ef6baa7e6e5457671daa7d844c6360d1f1c' 'f31b050989a5b816fc56128ad94268a7589ee6ba285688292e461d3b1289ac2d')
sha256sums_x86_64=('485b6572e1de289bb6dbdf20e14f469cea2b5078761bb8ca69325832b2be5ec8')
sha256sums_aarch64=('bce01aff7a7c040a6f76857089c9c7505303fe958e0d700c35eafde67e6e3152')

package() {
  cd "anirust-$pkgver-linux-$CARCH"
  install -dm755 "$pkgdir/usr/lib/anirust" "$pkgdir/usr/bin"
  cp -a . "$pkgdir/usr/lib/anirust/"
  ln -s /usr/lib/anirust/anirust "$pkgdir/usr/bin/anirust"
  ln -s /usr/lib/anirust/anirust-cli "$pkgdir/usr/bin/anirust-cli"
  install -Dm644 anirust.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_app_id.svg"
  install -Dm644 "$srcdir/$_app_id.desktop" "$pkgdir/usr/share/applications/$_app_id.desktop"
  install -Dm644 "$srcdir/$_app_id.metainfo.xml" "$pkgdir/usr/share/metainfo/$_app_id.metainfo.xml"
}
