# Maintainer: mrfrok
pkgname=anirust-bin
pkgver=1.1.6
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
_metadata="$pkgname-$pkgver"
source=("$_metadata.desktop::https://raw.githubusercontent.com/mrFrok/AniRust/v$pkgver/packaging/linux/$_app_id.desktop"
        "$_metadata.metainfo.xml::https://raw.githubusercontent.com/mrFrok/AniRust/v$pkgver/packaging/linux/$_app_id.metainfo.xml")
source_x86_64=("$url/releases/download/v$pkgver/anirust-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/anirust-$pkgver-linux-aarch64.tar.gz")
sha256sums=('5ec162600363123a4fa2b624308b4ef6baa7e6e5457671daa7d844c6360d1f1c' 'defe64517d5f67d2649d1cd2432d014fc49ffa67329af0fc868d4a3d255f19b3')
sha256sums_x86_64=('81b8be2dd3435126e1e9a7c96fb0e1ba181f5ba43b7461061b3dd8f0752eadf5')
sha256sums_aarch64=('f13d15836d16d1b73a23dad278a1435f2d5e3e12ba77bc4591d126cc3aa8c023')

package() {
  cd "anirust-$pkgver-linux-$CARCH"
  install -dm755 "$pkgdir/usr/lib/anirust" "$pkgdir/usr/bin"
  cp -a . "$pkgdir/usr/lib/anirust/"
  ln -s /usr/lib/anirust/anirust "$pkgdir/usr/bin/anirust"
  ln -s /usr/lib/anirust/anirust-cli "$pkgdir/usr/bin/anirust-cli"
  install -Dm644 anirust.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_app_id.svg"
  install -Dm644 "$srcdir/$_metadata.desktop" "$pkgdir/usr/share/applications/$_app_id.desktop"
  install -Dm644 "$srcdir/$_metadata.metainfo.xml" "$pkgdir/usr/share/metainfo/$_app_id.metainfo.xml"
}
