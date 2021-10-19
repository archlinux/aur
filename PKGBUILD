# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=flashplayer-standalone-debug
pkgver=32.0.0.465
pkgrel=2
pkgdesc="Standalone, debug version of Adobe Flash Player"
arch=(x86_64 i686)
url="https://www.adobe.com/support/flashplayer/debug_downloads.html"
license=(custom)
depends=(gtk2 libgl nss)
optdepends=('alsa-lib: for sound through alsa')
makedepends=(gendesk)
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://fpdownload.macromedia.com/pub/${pkgname%-standalone-debug}/updaters/${pkgver%%.*}/flash_player_sa_linux_debug.${arch}.tar.gz")
sha512sums=('54c5f21f75008b846f691b99e67df755108ff8e962a36b1f764b45d922747fd6ef53053eeff67e3d4a59cf7789d1d012e81479256477a945fd8f0032fec2234d')

prepare() {
  cd "${srcdir}"
  gendesk -f -n \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "Adobe Flash Player Debug Standalone" \
    --genericname "Flash Player Debug" \
    --comment "Debug player for using content created on the Adobe Flash platform" \
    --exec "/usr/bin/${pkgname%-standalone-debug}debugger" \
    --categories "Audio;AudioVideo;Graphics;GTK;Player;Video;Viewer" \
    --mimetypes "application/x-shockwave-flash;image/gif;image/jpg;image/png"
}

package () {
  install -Dm644 "${srcdir}/license.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/license.pdf"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${srcdir}/${pkgname%-standalone-debug}debugger" "$pkgdir/usr/bin/flashplayerdebugger"
}