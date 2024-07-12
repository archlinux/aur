# Maintainer: Nebulosa  <nebulosa2007 at yandex dot ru>

pkgname=cassette-bin
pkgver=0.2.0
pkgrel=1
_buildtask=352579
_buildid=100
pkgdesc="GTK4/Adwaita application that allows you to use Yandex Music service on Linux operating systems"
arch=(aarch64 i686 ppc64le x86_64)
url="https://github.com/Rirusha/${pkgname%-bin}"
_buildurl="https://git.altlinux.org/tasks"
license=(GPL-3.0-only)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  glibc
  glib2
  gtk4
  hicolor-icon-theme
  libadwaita
  libgee
  libxml2
  sqlite
  webkitgtk-6.0
)
optdepends=(
  'gst-libav: nonfree media decoding'
  'gst-plugins-bad: media decoding'
  'gst-plugins-good: media decoding'
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source_aarch64=($_buildurl/$_buildtask/build/$_buildid/aarch64/rpms/${pkgname%-bin}-$pkgver-alt1.aarch64.rpm)
source_i686=(   $_buildurl/$_buildtask/build/$_buildid/i586/rpms/${pkgname%-bin}-$pkgver-alt1.i586.rpm)
source_ppc64le=($_buildurl/$_buildtask/build/$_buildid/ppc64le/rpms/${pkgname%-bin}-$pkgver-alt1.ppc64le.rpm)
source_x86_64=( $_buildurl/$_buildtask/build/$_buildid/x86_64/rpms/${pkgname%-bin}-$pkgver-alt1.x86_64.rpm)
md5sums_aarch64=('3ad65311f45c933b8da4a598440a58a2')
md5sums_i686=(   'b94139cd4dda7a43135f5c5606374ee2')
md5sums_ppc64le=('439c6735d8aa78e5f07b1cf32ce08f4b')
md5sums_x86_64=( 'de1ccf1e6e2ff9c2f632feba3831987f')

prepare(){
  #Quick fix after release: https://github.com/Rirusha/Cassette/commit/64d69b910177675b3cbce398a18b605d14928be0
  sed -i 's/Categories=Audio/Categories=GNOME;GTK;Music;Audio;AudioVideo;/' usr/share/applications/io.github.Rirusha.Cassette.desktop
}

package() {
  _prjname="io.github.Rirusha.Cassette"
  install   -vDm755 usr/bin/${pkgname%-bin}                             -t "$pkgdir"/usr/bin/
  install   -vDm644 usr/share/applications/$_prjname.desktop            -t "$pkgdir"/usr/share/applications/
  install   -vDm644 usr/share/glib-2.0/schemas/$_prjname.gschema.xml    -t "$pkgdir"/usr/share/glib-2.0/schemas/
  install   -vDm644 usr/share/icons/hicolor/scalable/apps/$_prjname.svg -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
  install   -vDm644 usr/share/icons/hicolor/symbolic/apps/*.svg         -t "$pkgdir"/usr/share/icons/hicolor/symbolic/apps/
  for _lang in be es ru; do
    install -vDm644 usr/share/locale/$_lang/LC_MESSAGES/${pkgname%-bin}.mo "$pkgdir"/usr/share/locale/$_lang/LC_MESSAGES/${pkgname%-bin}.mo
  done
}
