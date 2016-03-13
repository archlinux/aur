# Maintainer: Soukyuu <chrno-sphered at hotmail dot com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>
pkgname=deadbeef-git
pkgver=r6511.88b9879
pkgrel=1
pkgdesc="Music player based on GTK2 (devel branch)"
url="http://deadbeef.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('alsa-lib' 'desktop-file-utils' 'gtk2' 'hicolor-icon-theme' 'gtkglext' 'jansson')
makedepends=('curl' 'faad2' 'flac' 'git' 'intltool' 'imlib2' 'libcddb' 'libcdio' 'libmad' 'libpulse' 'libsamplerate' 'libvorbis' 'libx11' 'libzip' 'wavpack' 'yasm')
optdepends=('libsamplerate: for dsp_libsrc plugin (resampler)'
            'libsm: optional dependency for gtkui session client support'
            'libice: optional dependency for gtkui session client support'
            'alsa-lib: ALSA support'
            'alsa-oss: for OSS output plugin'
            'libvorbis: for ogg vorbis plugin'
            'libogg: for ogg vorbis plugin'
            'libmad: for mp3 plugin (mpeg1,2 layers1,2,3)'
            'flac: for flac plugin'
            'curl: for last.fm, vfs_curl (shoutcast/icecast), artwork plugins'
            'imlib2: for artwork plugin'
            'wavpack: for wavpack plugin'
            'libsndfile: for sndfile plugin'
            'libcdio: for cd audio plugin'
            'libcddb: for cd audio plugin'
            'faad2: for AAC plugin'
            'dbus: for notification daemon support (OSD current song notifications)'
            'pulseaudio: for PulseAudio output plugin'
            'libx11: for global hotkeys plugin'
            'zlib: for Audio Overload plugin (psf, psf2, etc), GME (for vgz)'
            'libsidplay: for SID player plugin'
            'yasm: required to build assembly portions of ffap plugin'
            'libzip: for vfs_zip plugin')
install='deadbeef.install'
options=('!libtool')
conflicts=('deadbeef')
provides=('deadbeef')
source=('git+https://github.com/Alexey-Yakovenko/deadbeef')
md5sums=('SKIP')

prepare() {
  cd "$srcdir/deadbeef"
 
  ./autogen.sh
  ./configure --prefix=/usr --enable-ffmpeg --enable-gtk2 --disable-gtk3
}

build() {
  cd "$srcdir/deadbeef"
  
  make
}

package() {
  cd "$srcdir/deadbeef"

  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd "$srcdir/deadbeef"
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}
