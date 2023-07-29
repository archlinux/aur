# Maintainer: Michael Kogan <michael dot kogan at gmx dot net>
# Contributor: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>

pkgname=gmusicbrowser-shimmer
pkgver=1.1.16
pkgrel=3
pkgdesc="An open-source jukebox for large collections of mp3/ogg/flac/mpc/ape files, written in perl with Shimmer layout"
arch=('any')
url="https://github.com/shimmerproject/gmusicbrowser"
license=('GPL3')
makedepends=('discount')
depends=('gtk2-perl' 'hicolor-icon-theme' 'perl-net-dbus')
optdepends=('alsa-utils: enables the ALSA backend'
            'flac123: flac support for the ALSA backend'
            'mpg321: mp3 support for the ALSA backend'
            'vorbis-tools: vorbis support for the ALSA backend'
            'mplayer: enables the mplayer backend'
            'perl-glib-object-introspection: enables the gstreamer backend'
            'gst-plugins-base: vorbis support for the gstreamer backend' 
            'gst-plugins-good: flac support for the gstreamer backend'
            'gst-plugins-bad: mpc support for the gstreamer backend'
            'gst-plugins-ugly: mp3 support for the gstreamer backend'
            'perl-locale-gettext: localization support'
            'perl-gtk2-trayicon: tray icon support'
            'perl-gtk2-appindicator: app indicator plugin support'
            'perl-gtk2-webkit: alternative web-based plugin support'
            'perl-net-dbus: control gmusicbrowser through dbus and gnome hotkeys'
            'perl-gtk2-notify: show notifications using libnotify'
            'perl-html-parser: support for accented characters in lyrics plugin')
conflicts=('gmusicbrowser' 'gmusicbrowser-git')
provides=(gmusicbrowser)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/squentin/gmusicbrowser/archive/v$pkgver.tar.gz"
        "shimmer.patch")
sha256sums=('fa86235c0e39def45a061b66a92321f60eb3b054a79a0f010db101a427f2785c'
            '30a4451be1c86552a783473f7a7007892daac0a64c632756ccbc762401ce71a6')


prepare() {

    cd $srcdir/gmusicbrowser-$pkgver
    patch -p1 -i $srcdir/shimmer.patch
}

package() {
   cd ${srcdir}/gmusicbrowser-$pkgver
   make DESTDIR=${pkgdir} install

   # put some images in sane locations
   install -Dm644 pix/trayicon.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/gmusicbrowser.png
   install -Dm644 pix/gmusicbrowser32x32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/gmusicbrowser.png
   install -Dm644 pix/gmusicbrowser48x48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/gmusicbrowser.png
   install -Dm644 pix/gmusicbrowser48x48.png "$pkgdir"/usr/share/pixmaps/gmusicbrowser.png
}
