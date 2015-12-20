# Maintainer:  Kamran Mackey <kamranm1200@gmail.com>
# Contributor: richteer <richteer at lastprime.net>
# Contributor: DrZaius <lou at fakeoutdoorsman.com>

pkgname=ffmpeg-git
pkgver=r77407.f6830cf
pkgrel=11
pkgdesc="Complete solution to record, convert and stream audio and video (git version)"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://ffmpeg.org/"
depends=(
      'alsa-lib' 'bzip2' 'fontconfig' 'fribidi' 'gnutls' 'gsm' 'lame' 'libass'
      'libbluray' 'libmodplug' 'libpulse' 'libsoxr' 'libssh' 'libtheora'
      'libva' 'libvdpau' 'libwebp' 'opencore-amr' 'openjpeg' 'opus'
      'schroedinger' 'sdl' 'speex' 'v4l-utils' 'xvidcore' 'zlib'
      'libdcadec.so' 'libvidstab.so' 'libvorbis.so' 'libvorbisenc.so'
      'libvpx.so' 'libx264.so' 'libx265.so'
      'celt' 'faac' 'frei0r-plugins' 'jack' 'ladspa' 'libaacplus'
      'libavc1394' 'libbs2b' 'libcaca' 'libcdio-paranoia' 'libcl' 'libdc1394'
      'libfdk-aac' 'libgme' 'libiec61883' 'libutvideo-git'
      'libxv' 'mesa' 'openal' 'opencl-headers' 'openh264'
      'rtmpdump' 'shine' 'snappy' 'twolame' 'vid.stab'
      'vo-aacenc' 'vo-amrwbenc' 'wavpack' 'xavs' 'zeromq' 'zvbi'
)
makedepends=('hardening-wrapper' 'ladspa' 'libvdpau' 'yasm')
optdepends=('ladspa: LADSPA filters')
provides=(
      'libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
      'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
      'libswscale.so' 'ffmpeg'
)
conflicts=('ffmpeg' 'ffmpeg-full-git')
source=("$pkgname"::'git://github.com/ffmpeg/ffmpeg.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --disable-static \
    --enable-shared \
    --enable-avisynth \
    --enable-avresample \
    --enable-decoder=atrac3 \
    --enable-decoder=atrac3p \
    --enable-dxva2 \
    --enable-fontconfig \
    --enable-frei0r \
    --enable-gnutls \
    --enable-gpl \
    --enable-gray \
    --enable-ladspa \
    --enable-libaacplus \
    --enable-libass \
    --enable-libbluray \
    --enable-libdcadec \
    --enable-libbs2b \
    --enable-libcaca \
    --enable-libcdio \
    --enable-libcelt \
    --enable-libdc1394 \
    --enable-libfaac \
    --enable-libfdk-aac \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgme \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore-amrnb \
    --enable-libopencore-amrwb \
    --enable-libopencv \
    --enable-libopenh264 \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-librtmp \
    --enable-libschroedinger \
    --enable-libshine \
    --enable-libsnappy \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libssh \
    --enable-libtheora \
    --enable-libtwolame \
    --enable-libutvideo \
    --enable-libv4l2 \
    --enable-libvidstab \
    --enable-libvo-aacenc \
    --enable-libvo-amrwbenc \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwavpack \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxavs \
    --enable-libxcb \
    --enable-libxcb-shm \
    --enable-libxcb-xfixes \
    --enable-libxcb-shape \
    --enable-libxvid \
    --enable-libzmq \
    --enable-libzvbi \
    --enable-nonfree \
    --enable-openal \
    --enable-opencl \
    --enable-opengl \
    --enable-openssl \
    --enable-runtime-cpudetect \
    --enable-swresample \
    --enable-vdpau \
    --enable-version3

  make
  make tools/qt-faststart
  make doc
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install install-man
  install -D -m755 tools/qt-faststart "$pkgdir/usr/bin/qt-faststart"
}
