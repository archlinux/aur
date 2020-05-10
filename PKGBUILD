# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: RobbeR49 <robertsna@gmail.com>

pkgname=gmusicbrowser-git
pkgver=1.1.15.r54.g4538a5a
pkgrel=1
pkgdesc="An open-source jukebox for large collections of mp3/ogg/flac files, written in perl."
arch=(i686 x86_64 aarch64)
url="http://gmusicbrowser.org/"
license=(GPL3)
depends=(gtk2-perl perl-net-dbus perl-locale-gettext perl-glib-object-introspection)
makedepends=(git markdown)
optdepends=('alsa-utils: enables the ALSA backend'
            'flac123: flac support for the ALSA backend'
            'mpg321: mp3 support for the ALSA backend'
            'vorbis-tools: vorbis support for the ALSA backend'
            'mplayer: enables the mplayer backend'
            'mpv: enables the mpv backend'
            'gst-plugins-base: vorbis support'
            'gst-plugins-good: flac support'
            'gst-plugins-ugly: mp3 support'
            'perl-gtk2-trayicon: tray icon support'
            'perl-gtk2-webkit: alternative web-based plugin support'
            'perl-gnome2-wnck: titlebar plugin support'
            'perl-html-parser: support for accented characters in lyrics plugin'
            'perl-gtk2-notify: support for notify plugin')
provides=(gmusicbrowser)
conflicts=(gmusicbrowser)
source=("git+http://github.com/squentin/gmusicbrowser.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}      

build() {
  cd "${srcdir}/${pkgname%-git}"
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
