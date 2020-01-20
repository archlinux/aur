# Maintainer: Andreas Linz <alinz@klingt.net>
# based on `bitwig-studio-demo` AUR package

pkgname='bitwig-8-track'
pkgver=3.1.2
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
sha512sums=('405de9ab6352d85a3bb6250f4e024d7fcef7d3b92879732cf985ac33b3979c4f75965a57e8f838f1df2e1d2039b65d0e4c4d81abd8d35246db4375ae18afd36f')

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
