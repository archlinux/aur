# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: RobbeR49 <robertsna@gmail.com>

pkgname=gmusicbrowser-git
pkgver=1.1.99.1.r32.g8f84c7c
pkgrel=2
pkgdesc="Open-source jukebox for large collections of mp3/ogg/flac files, written in perl."
arch=(any)
url="https://gmusicbrowser.org/"
license=(GPL3)
depends=(perl-gtk3 perl-net-dbus perl-locale-gettext perl-glib-object-introspection)
makedepends=(git discount)
optdepends=('alsa-utils: enables the ALSA backend'
            'flac123: flac support for the ALSA backend'
            'mpg321: mp3 support for the ALSA backend'
            'vorbis-tools: vorbis support for the ALSA backend'
            'mplayer: enables the mplayer backend'
            'mpv: enables the mpv backend'
            'gst-plugins-base: vorbis support'
            'gst-plugins-good: flac support'
            'gst-plugins-ugly: mp3 support'
            'libappindicator-gtk3: tray icon support'
            'webkit2gtk: alternative web-based plugin support'
            'libwnck3: titlebar plugin support'
            'perl-html-parser: support for accented characters in lyrics plugin'
            'libnotify: support for notify plugin')
provides=(gmusicbrowser)
conflicts=(gmusicbrowser)
source=("git+https://github.com/squentin/gmusicbrowser.git")
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
  make DESTDIR="${pkgdir}" install
}
