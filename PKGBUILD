# Maintainer: mrfrok
pkgname=anirust-bin
pkgver=1.1.3
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
sha256sums=('5ec162600363123a4fa2b624308b4ef6baa7e6e5457671daa7d844c6360d1f1c' 'ba9f812ddcde8a1cb09fce69b145faed70f6baebaacbc040d9fee63f64721575')
sha256sums_x86_64=('0550b875f9ddac8be5ca3143b8949a97dfe81331fbd8d3cea553297a8f2512e9')
sha256sums_aarch64=('1931200b3cd605692a150be278fb1132a15aa50e1c305b4198e1e6cc20497ac7')

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
