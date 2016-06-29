#
# Maintainer: Iacopo Isimbaldi <isiachi@rhye.it>
#

pkgname=ffmpeg-full
pkgver=3.0.2
pkgrel=4
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video (with all options)'
arch=('i686' 'x86_64')
url='http://ffmpeg.org/'
license=('GPL3' 'custom:UNREDISTRIBUTABLE')
depends=('alsa-lib' 'bzip2' 'fontconfig' 'fribidi' 'gnutls' 'gsm' 'lame'
         'libass' 'libavc1394' 'libbluray' 'libiec61883' 'libmodplug'
         'libpulse' 'libsoxr' 'libssh' 'libtheora' 'libva' 'libvdpau' 'libwebp'
         'netcdf' 'opencore-amr' 'openjpeg' 'opus' 'schroedinger' 'sdl' 'speex'
         'v4l-utils' 'xvidcore' 'zlib'
         'libdcadec.so' 'libvidstab.so' 'libvorbis.so' 'libvorbisenc.so'
         'libvpx.so' 'libx264.so' 'libx265.so'
         'celt' 'chromaprint-fftw' 'faac' 'frei0r-plugins' 'jack' 'kvazaar'
         'ladspa' 'libbs2b' 'libcaca' 'libcdio-paranoia' 'libcl' 'libdc1394'
         'libfdk-aac' 'libgme' 'libilbc' 'libmfx-git' 'libxv'
         'mesa' 'nut-multimedia-git' 'openal' 'opencl-headers' 'openh264' 'rubberband'
         'rtmpdump' 'shine' 'smbclient' 'snappy' 'tesseract' 'twolame' 'vid.stab'
         'vo-aacenc' 'vo-amrwbenc' 'wavpack' 'xavs' 'zeromq' 'zimg' 'zvbi')
makedepends=('hardening-wrapper' 'libvdpau' 'nvidia-sdk' 'yasm')
optdepends=('intel-media-sdk: for Intel QSV encoding/decoding')
conflicts=('ffmpeg' 'ffmpeg-git' 'ffmpeg-full-git')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
          'libswscale.so'
          'ffmpeg')
source=(http://ffmpeg.org/releases/ffmpeg-$pkgver.tar.bz2{,.asc}
        UNREDISTRIBUTABLE.txt)
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8') # ffmpeg-devel
sha256sums=('30e3c77c2f4c358ed087869455a7496cbd7753a5e1b98d20ba49c1004009fd36'
            'SKIP'
            'e0c1b126862072a71e18b9580a6b01afc76a54aa6e642d2c413ba0ac9d3010c4')

build() {
  cd ${pkgname%-full}-$pkgver

  ./configure \
    --prefix=/usr \
    --extra-cflags="-I/usr/include/nvidia-sdk" \
    --extra-cxxflags="-std=gnu++98" \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-avisynth \
    --enable-avresample \
    --enable-chromaprint \
    --enable-decoder=atrac3 \
    --enable-decoder=atrac3p \
    --enable-dxva2 \
    --enable-fontconfig \
    --enable-frei0r \
    --enable-gcrypt \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --enable-gray \
    --enable-ladspa \
    --enable-libass \
    --enable-libbluray \
    --enable-libbs2b \
    --enable-libcaca \
    --enable-libcdio \
    --enable-libcelt \
    --enable-libdc1394 \
    --enable-libdcadec \
    --enable-libfaac \
    --enable-libfdk-aac \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgme \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libilbc \
    --enable-libkvazaar \
    --enable-libmfx \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libnut \
    --enable-libopencore-amrnb \
    --enable-libopencore-amrwb \
    --enable-libopencv \
    --enable-libopenh264 \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-librtmp \
    --enable-librubberband \
    --enable-libschroedinger \
    --enable-libshine \
    --enable-libsmbclient \
    --enable-libsnappy \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libssh \
    --enable-libtesseract \
    --enable-libtheora \
    --enable-libtwolame \
    --enable-libv4l2 \
    --enable-libvidstab \
    --enable-libvo-amrwbenc \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwavpack \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxavs \
    --enable-libxcb \
    --enable-libxcb-shape \
    --enable-libxcb-shm \
    --enable-libxcb-xfixes \
    --enable-libxvid \
    --enable-libzimg \
    --enable-libzmq \
    --enable-libzvbi \
    --enable-netcdf \
    --enable-nonfree \
    --enable-nvenc \
    --enable-openal \
    --enable-opencl \
    --enable-opengl \
    --enable-openssl \
    --enable-runtime-cpudetect \
    --enable-shared \
    --enable-swresample \
    --enable-vaapi \
    --enable-vdpau \
    --enable-version3

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play,server}.1
}

package() {
  cd ${pkgname%-full}-$pkgver

  make DESTDIR="$pkgdir" install install-man
  install -Dm755 tools/qt-faststart "$pkgdir"/usr/bin/qt-faststart
  install -Dm644 "$srcdir"/UNREDISTRIBUTABLE.txt "$pkgdir/usr/share/licenses/$pkgname/UNREDISTRIBUTABLE.txt"
}

# vim:set ts=2 sw=2 et:
