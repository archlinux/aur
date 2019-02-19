# Contributor: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: RobbeR49 <robertsna@gmail.com>

pkgname=gmusicbrowser-rhfork-git
pkgver=1.1.15.r66.g1519425
pkgrel=1
pkgdesc="An open-source jukebox for large collections of mp3/ogg/opus/flac files, written in perl. RomanHargrave fork."
arch=('i686' 'x86_64')
url="http://gmusicbrowser.org/"
license=('GPL3')
depends=('gtk2-perl' 'perl-net-dbus' 'perl-locale-gettext' 'perl-glib-object-introspection')
makedepends=('git' 'markdown')
optdepends=('alsa-utils: enables the ALSA backend'
            'flac123: flac support for the ALSA backend'
            'mpg321: mp3 support for the ALSA backend'
            'vorbis-tools: vorbis support for the ALSA backend'
            'opus: opus support'
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
provides=('gmusicbrowser' 'gmusicbrowser-git')
conflicts=('gmusicbrowser' 'gmusicbrowser-git')
source=("${pkgname}::git+http://github.com/RomanHargrave/gmusicbrowser.git#branch=feature-palooza")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}      

build() {
   cd "${srcdir}/${pkgname}"
   make
}

package() {
   cd "${srcdir}/${pkgname}"
   make DESTDIR="$pkgdir" install
}
