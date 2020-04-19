# Maintainer: Andreas Linz <alinz@klingt.net>
# based on `bitwig-studio-demo` AUR package

pkgname='bitwig-8-track'
pkgver=3.1.3
pkgrel=1
pkgdesc="Music production system for production, remixing and performance. Lite version limited to 8 tracks for german Beat music magazine."
arch=( 'x86_64' )
url="http://www.bitwig.com"
license=('custom')
depends=( 'jack' 'xdg-utils' 'zenity' 'xcb-util-wm' 'libbsd')
optdepends=(
             'alsa-lib'
             'oss'
             'gst-libav: MP3 support'
           )
provides=('bitwig-studio')
conflicts=('bitwig-studio-demo-rc' 'bitwig-studio-demo' 'bitwig-studio')
# strip debugging symbols
options=(!strip)
source=("https://downloads.bitwig.com/stable/${pkgver}/bitwig-studio-${pkgver}.deb")
sha512sums=('02b6c9c21bd0924370b32f2132d943a245d8410be0b57850aeedf75d8ba98d92b6b1816b42300910d59d935f9a4b0a865b37b4b0edd67f347e603bf5ad0106ea')

package() {
  cd $srcdir

  # create pkgdir folders
  install -d $pkgdir/usr/bin
  install -d $pkgdir/opt/${pkgname}
  install -d $pkgdir/usr/share/{applications,icons}
  install -d $pkgdir/usr/share/licenses/$pkgname

  tar -xf ./data.tar.xz -C "${pkgdir}/"

  install -m644 ${pkgdir}/opt/bitwig-studio/EULA.rtf $pkgdir/usr/share/licenses/${pkgname}/LICENSE

  # Fix launcher category
  sed -i 's:Categories=Multimedia:Categories=Multimedia;AudioVideo;Player;Recorder;:' \
    $pkgdir/usr/share/applications/bitwig-studio.desktop
}
