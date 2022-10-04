# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Alexey Yakovenko <waker@users.sourceforge.net>

pkgname=deadbeef
pkgver=1.9.2
pkgrel=2
pkgdesc="Modular GTK audio player for GNU/Linux"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://deadbeef.sourceforge.io/"
license=(GPL2 LGPL2.1 ZLIB)
depends=(gtk3 alsa-lib jansson libdispatch)
makedepends=(libvorbis libmad flac curl imlib2 wavpack libsndfile libcdio libcddb
             libx11 faad2 zlib intltool pkgconfig libpulse libzip libsamplerate
             yasm ffmpeg4.4 clang opusfile mpg123)
optdepends=('alsa-oss: for OSS output plugin'
            'cdparanoia: for cd audio plugin'
            'curl: for last.fm, vfs_curl (shoutcast/icecast), artwork plugins'
            'dbus: for notification daemon support (OSD current song notifications)'
            'faad2: for AAC plugin'
            'ffmpeg4.4: for ffmpeg plugin'
            'flac: for flac plugin'
            'imlib2: for artwork plugin'
            'libcddb: for cd audio plugin'
            'libcdio: for cd audio plugin'
            'libice: optional dependency for gtkui session client support'
            'libmad: for mp3 plugin (mpeg1,2 layers1,2,3)'
            'libogg: for ogg vorbis plugin'
            'libsamplerate: for dsp_libsrc plugin (resampler)'
            'libsidplay: for SID player plugin'
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
source=("https://sourceforge.net/projects/deadbeef/files/travis/linux/${pkgver}/deadbeef-${pkgver}.tar.bz2")
sha512sums=('fa4298fb3a89b3891c2f0403b2c66e20f64206101ad44f53be5208a69b33d3de3e0ced329cf090c17a1a3c4f7b28920baf5f8c964df2b6bdea6095465d0a02d9')

export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CC=clang CXX=clang++
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
