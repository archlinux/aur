# Maintainer: mrfrok
pkgname=anirust-bin
pkgver=1.1.4
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
sha256sums=('5ec162600363123a4fa2b624308b4ef6baa7e6e5457671daa7d844c6360d1f1c' '0173177bcc55c88594e7a9c311328c837a02bc2e57cb8a4d6bf94ffba0472fd5')
sha256sums_x86_64=('9e9f960877ecf5b25ce4bca7c1f57c3eff2524aad10d377dcccceb9ca278ea27')
sha256sums_aarch64=('335cd5aa7c2d8ceeda0fd739cd727997ce4bca28c739dc40b5c561c9a88ce409')

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
