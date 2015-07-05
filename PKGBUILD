# Contributor: m23l <post235@gmail.com>

pkgname=gmusicbrowser-shimmer-git
pkgver=20110405
pkgrel=1
pkgdesc="An open-source jukebox for large collections of mp3/ogg/flac/mpc/ape files, written in perl with shimmer layout"
arch=('i686' 'x86_64')
url="http://gmusicbrowser.org"
license=('GPL3')
depends=('gtk2-perl')
makedepends=('git')
optdepends=('alsa-utils: enables the ALSA backend'
            'flac123: flac support for the ALSA backend'
            'mpg321: mp3 support for the ALSA backend'
            'vorbis-tools: vorbis support for the ALSA backend'
            'mplayer: enables the mplayer backend'
            'perl-gstreamer: enables the gstreamer backend'
            'gstreamer0.10-base: vorbis supportfor the gstreamer backend' 
            'gstreamer0.10-good-plugins: flac support for the gstreamer backend'
            'gstreamer0.10-ugly-plugins: mp3 support for the gstreamer backend'
            'perl-gtk2-trayicon: tray icon support'
            'perl-gtk2-mozembed: web-based plugins support'
            'perl-gtk2-webkit: alternative web-based plugin support'
            'perl-locale-gettext: localization support'
            'perl-net-dbus: control gmusicbrowser through dbus and gnome hotkeys'
            'perl-gnome2-wnck: titlebar plugin support')
conflicts=('gmusicbrowser' 'gmusicbrowser-devel')
source=()
md5sums=()

_gitroot="https://github.com/shimmerproject/gmusicbrowser.git"
_gitname="gmusicbrowser"

build() {
   cd ${srcdir}
   msg "Connecting to GIT server...."

   if [ -d $startdir/src/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
   else
      git clone $_gitroot
   fi

   msg "GIT checkout done or server timeout"
   msg "Starting make..."

   cd ${srcdir}
               
   cp -r "$_gitname" "$_gitname-build"
   cd "$_gitname-build"

   make DESTDIR=${pkgdir} install || return 1
}

