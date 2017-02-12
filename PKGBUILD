# Contributor: Frederic Bezies <fredbezies@gmail.com>
# Maintainer: Elrondo46 <elrond94@hotmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=ffmpeg-nvenc
pkgver=3.2.4
pkgrel=2
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video with Nvidia CUDA Hardware Acceleration'
arch=('x86_64')
url='http://ffmpeg.org/'
license=('GPL3')
depends=('alsa-lib' 'bzip2' 'fontconfig' 'fribidi' 'gmp' 'gnutls' 'gsm' 'lame'
         'libass' 'libavc1394' 'libbluray' 'libiec61883' 'libmodplug'
         'libpulse' 'libsoxr' 'libssh' 'libtheora' 'libva' 'libvdpau' 'libwebp'
         'netcdf' 'opencore-amr' 'openjpeg' 'opus' 'schroedinger' 'sdl' 'speex'
         'v4l-utils' 'xvidcore' 'zlib' 'cuda' 'nvidia-sdk' 
         'nvidia' 'libvidstab.so' 'libvorbis.so' 'libvorbisenc.so' 'libvpx.so'
         'libx264.so' 'libx265.so')
makedepends=('hardening-wrapper' 'ladspa' 'libvdpau' 'yasm')
optdepends=('ladspa: LADSPA filters')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
          'libswscale.so' 'ffmpeg')
conflicts=('ffmpeg' 'ffmpeg-full-nvenc' 'ffmpeg-nvenc-manjaro')
source=(http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.bz2)
sha256sums=('c0fa3593a2e9e96ace3c1757900094437ad96d1d6ca19f057c378b5f394496a4')

build() {
  cd ffmpeg-${pkgver}

  ./configure \
    --prefix='/usr' \
    --enable-nonfree \
    --enable-nvenc \
    --enable-rpath \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-avisynth \
    --enable-avresample \
    --enable-fontconfig \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --enable-ladspa \
    --enable-libass \
    --enable-libbluray \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --disable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-libschroedinger \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libssh \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvidstab \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxvid \
    --enable-netcdf \
    --enable-shared \
    --enable-version3 \
    --enable-x11grab \
--extra-cflags="-I/usr/include/nvidia-sdk \
                    -I/opt/cuda/include \
                    -I/usr/lib/jvm/$(archlinux-java get)/include \
                    -I/usr/lib/jvm/$(archlinux-java get)/include/linux" \
--extra-ldflags="-L/opt/cuda/lib64" \
--enable-libnpp \
--enable-cuda \



  make
  make tools/qt-faststart
  make doc/ff{mpeg,play,server}.1
}

package() {
  cd ffmpeg-${pkgver}

  make DESTDIR="${pkgdir}" install install-man
  install -Dm 755 tools/qt-faststart "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
