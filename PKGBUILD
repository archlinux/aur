# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Ole Jon Bjørkum <mail at olejon dot net>

pkgname=spotify-legacy
pkgver=0.9.17
pkgrel=2
pkgdesc="A proprietary music streaming service."
arch=('x86_64')
url="https://www.spotify.com/download/linux/"
license=('custom')
depends=('alsa-lib' 'gconf' 'gtk2' 'glib2' 'nss' 'libgcrypt15' 'libsystemd' 'libxss' 'qt4')
optdepends=('ffmpeg0.10: Support for playback of local files'
            'zenity: Support for importing local files')
provides=("spotify=$pkgver")
conflicts=('spotify' 'spotify-beta' 'spotify094' 'spotify-stable')
source=("http://repository-origin.spotify.com/pool/non-free/s/spotify/spotify-client-${pkgver}_${pkgver}.8.gd06432d.31-1_amd64.deb"
        'spotify-LICENSE.html::https://www.spotify.com/us/legal/end-user-agreement/')
md5sums=('69a320368ded33cfcc4e3bb4cc71575c'
         'SKIP')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir"
  install -Dm644 spotify-LICENSE.html "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"

  cd "$pkgdir/opt/spotify/spotify-client/"
  install -Dm644 spotify.desktop -t "$pkgdir/usr/share/applications/"
  for res in 16 22 24 32 48 64 128 256 512; do
    install -Dm644 Icons/spotify-linux-$res.png "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/spotify-client.png"
  done
  install -Dm644 licenses.xhtml -t "$pkgdir/usr/share/licenses/$pkgname/"
}
