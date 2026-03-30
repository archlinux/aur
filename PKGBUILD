# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Alexey Yakovenko <waker@users.sourceforge.net>

pkgname=deadbeef
pkgver=1.10.2
pkgrel=1
pkgdesc="Modular GTK audio player for GNU/Linux"
arch=(x86_64 i686 pentium4 armv7h aarch64)
url="https://deadbeef.sourceforge.io/"
license=(GPL-2.0-or-later LGPL-2.1-or-later Zlib)
depends=(gtk3 alsa-lib jansson libdispatch libFLAC.so)
makedepends=(libvorbis libmad flac curl imlib2 wavpack libsndfile libcdio libcddb
             libx11 faad2 zlib intltool libpipewire libpulse libzip libsamplerate
             yasm ffmpeg clang opusfile mpg123)
optdepends=('alsa-oss: for OSS output plugin'
            'cdparanoia: for cd audio plugin'
            'curl: for last.fm, vfs_curl (shoutcast/icecast), artwork plugins'
            'dbus: for notification daemon support (OSD current song notifications)'
            'faad2: for AAC plugin'
            'ffmpeg: for ffmpeg plugin'
            'flac: for flac plugin'
            'imlib2: for artwork plugin'
            'libcddb: for cd audio plugin'
            'libcdio: for cd audio plugin'
            'libice: optional dependency for gtkui session client support'
            'libmad: for mp3 plugin (mpeg1,2 layers1,2,3)'
            'libogg: for ogg vorbis plugin'
            'libpipewire: for pipewire plugin'
            'libsamplerate: for dsp_libsrc plugin (resampler)'
            'libsm: optional dependency for gtkui session client support'
            'libsndfile: for sndfile plugin'
            'libvorbis: for ogg vorbis plugin'
            'libx11: for global hotkeys plugin'
            'libzip: for vfs_zip plugin'
            'mpg123: for MP1/MP2/MP3 playback'
            'opusfile: for opus plugin'
            'pulseaudio: for PulseAudio output plugin'
            'wavpack: for wavpack plugin'
            'yasm: required to build assembly portions of ffap plugin'
            'zlib: for Audio Overload plugin (psf, psf2, etc), GME (for vgz)')
conflicts=(deadbeef-pipewire-plugin-git)
source=(#"https://sourceforge.net/projects/deadbeef/files/travis/linux/${pkgver}/deadbeef-${pkgver}.tar.bz2"
        "https://sourceforge.net/projects/deadbeef/files/Builds/${pkgver}/linux/deadbeef-${pkgver}.tar.bz2")
sha512sums=('682cfee8839d55160c742f0bec2e870c8ad6ca0e119701766909017113d25d7c9d45f6e209861a35adcbc3c281209a9fc543d06da9d21808c26052141838afe8')

build () {
  cd "${pkgname}-${pkgver}"
  export CC=clang CXX=clang++
  ./configure --prefix=/usr --disable-gtk2
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
