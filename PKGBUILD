# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>
pkgname=gmusicbrowser-shimmer
pkgver=1.1.15
pkgrel=2
pkgdesc="An open-source jukebox for large collections of mp3/ogg/flac/mpc/ape files, written in perl with Shimmer layout"
arch=('any')
url="http://shimmerproject.org/our-projects/shimmer-for-gmusicbrowser/"
license=('GPL3')
depends=('gtk2-perl' 'hicolor-icon-theme' 'perl-net-dbus')
makedepends=('markdown')
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
            'perl-gstreamer: enables the gstreamer0.10 backend'
            'gstreamer0.10-base: vorbis support for the gstreamer0.10 backend' 
            'gstreamer0.10-good-plugins: flac support for the gstreamer0.10 backend'
            'gstreamer0.10-bad-plugins: mpc support for the gstreamer0.10 backend'
            'gstreamer0.10-ugly-plugins: mp3 support for the gstreamer0.10 backend'
            'perl-locale-gettext: localization support'
            'perl-gtk2-trayicon: tray icon support'
            'perl-gtk2-appindicator: app indicator plugin support'
            'perl-gtk2-mozembed: web-based plugins support'
            'perl-gtk2-webkit: alternative web-based plugin support'
            'perl-net-dbus: control gmusicbrowser through dbus and gnome hotkeys'
            'perl-gtk2-notify: show notifications using libnotify'
            'perl-html-parser: support for accented characters in lyrics plugin')
conflicts=('gmusicbrowser' 'gmusicbrowser-devel' 'gmusicbrowser-development' 'gmusicbrowser-git' 'gmusicbrowser-shimmer-git')
install=$pkgname.install
source=("https://github.com/squentin/gmusicbrowser/archive/v$pkgver.tar.gz"
        "perl524.patch"
        "shimmer.patch")
sha256sums=('c6c7101fe1f32cabe73f1093b023a30a4eb71bdb46a5f18f2b74c6817060e057'
            'b5a8196e7b3f8b7ad7da65d06ed4f767a871fcc2af3285a79599a6737646439e'
            '30a4451be1c86552a783473f7a7007892daac0a64c632756ccbc762401ce71a6')

prepare() {

    cd $srcdir/gmusicbrowser-$pkgver
    patch -p1 -i $srcdir/perl524.patch
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
