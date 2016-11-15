# Maintainer: Andreas Linz <alinz@klingt.net>
# based on `bitwig-studio-demo` AUR package

pkgname='bitwig-8-track'
pkgver=1.3.14
pkgrel=1
pkgdesc="Music production system for production, remixing and performance. Lite version limited to 8 tracks for german Beat music magazine."
arch=( 'x86_64' )
url="http://www.bitwig.com"
license=('custom')
depends=( 'jack' 'xdg-utils' 'zenity' 'xcb-util-wm' 'libbsd')
optdepends=(
             'alsa-lib'
             'oss'
             'libav: MP3 support'
           )
provides=('bitwig-studio')
conflicts=('bitwig-studio-demo-rc', 'bitwig-studio-demo', 'bitwig-studio')
# strip debugging symbols
options=(!strip)
source=("https://downloads.bitwig.com/stable/${pkgver}/bitwig-8-track-${pkgver}.deb")
md5sums=('53f0c6a9fe75e759f3847257a7cf71cc')

package() {
  cd $srcdir

  # create pkgdir folders
  install -d $pkgdir/usr/bin
  install -d $pkgdir/opt/${pkgname}
  install -d $pkgdir/usr/share/{applications,icons}
  install -d $pkgdir/usr/share/licenses/$pkgname

  tar -xf ./data.tar.gz -C "${pkgdir}/"

  install -m644 ${pkgdir}/opt/${pkgname}/EULA.rtf $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # Fix launcher category
  sed -i 's:Categories=Multimedia:Categories=Multimedia;AudioVideo;Player;Recorder;:' \
    $pkgdir/usr/share/applications/${pkgname}.desktop
}
