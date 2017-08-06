# Maintainer: Jason Mooradian <cowmix@gmail.com>
# Contributor: Jeff Keyte <jeff@keyte.me>

pkgname=openpht-ffmpeg
pkgver=2.8.11
pkgrel=2
pkgdesc='FFMPEGmodified for OpenPHT 1.8'
arch=('i686' 'x86_64')
url='http://ffmpeg.org'
license=('GPL2')
openpht='v1.8.0.148-573b6d73'
depends=('alsa-lib' 'avahi' 'boost-libs' 'curl' 'expat' 'freetype2' 'fribidi'
         'gcc-libs' 'glew' 'glibc' 'glu' 'libcdio' 'libgl' 'libjpeg' 'libmad'
         'libmicrohttpd' 'libmpeg2' 'libpng' 'libpulse' 'libsamplerate' 'llvm-libs'
         'libssh' 'libtiff' 'libusb-compat' 'libva' 'libvdpau' 'libx11'
         'libxext' 'libxrandr' 'lzo' 'pcre' 'python2' 'sdl' 'sdl_image'
         'sdl_mixer' 'sqlite' 'smbclient' 'taglib' 'tinyxml' 'yajl' 'zlib')
makedepends=('boost' 'cmake' 'doxygen' 'svn' 'java-environment'
             'libcec' 'libplist' 'nasm' 'swig' 'unzip' 'zip')
optdepends=('libplist: AirPlay support'
            'libcec: Pulse-Eight USB-CEC adapter support'
            'pulseaudio: PulseAudio support')
source=("http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.bz2"
  'openpht.conf'
)

prepare() {
  svn export https://github.com/RasPlex/OpenPHT.git/tags/"${openpht}"/lib/ffmpeg/patches "${srcdir}"/ffmpeg-"${pkgver}"/patches
}

build() {
  cd ffmpeg-"${pkgver}"
  ./configure --prefix="/usr/local" --disable-altivec --disable-amd3dnow --disable-avisynth --disable-crystalhd --disable-debug --disable-decoder=mpeg_xvmc --disable-devices --disable-doc --disable-dxva2 --disable-encoders --disable-extra-warnings --disable-ffmpeg --disable-ffplay --disable-ffprobe --disable-ffserver --disable-frei0r --disable-gray --disable-hardcoded-tables --disable-indevs --disable-libdc1394 --disable-libfaac --disable-libfreetype --disable-libgsm --disable-libmp3lame --disable-libnut --disable-libopencore-amrnb --disable-libopencore-amrwb --disable-libopencv --disable-libopenjpeg --disable-librtmp --disable-libschroedinger --disable-libspeex --disable-libtheora --disable-libvo-aacenc --disable-libvo-amrwbenc --disable-libvorbis --disable-libvpx --disable-libx264 --disable-libxavs --disable-libxvid --disable-memalign-hack --disable-mmi --disable-muxers --disable-nonfree --disable-outdevs --disable-small --disable-static --disable-symver --disable-vda --disable-version3 --disable-w32threads --disable-x11grab --enable-asm --enable-avcodec --enable-avdevice --enable-avfilter --enable-avformat --enable-bsfs --enable-bzlib --enable-dct --enable-demuxers --enable-fft --enable-filters --enable-gpl --enable-hwaccels --enable-libvorbis --enable-logging --enable-mdct --enable-muxer=adts --enable-muxer=ogg --enable-muxer=spdif --enable-network --enable-optimizations --enable-parsers --enable-pic --enable-postproc --enable-protocol=http --enable-pthreads --enable-rdft --enable-runtime-cpudetect --enable-shared --enable-stripping --enable-swscale --enable-swscale-alpha --enable-vaapi --enable-vdpau --enable-yasm --enable-zlib --host-libs=-lm
  make
}

package() {
  cd ffmpeg-"${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m 644 "${srcdir}"/openpht.conf "${pkgdir}"/etc/ld.so.conf.d/openpht.conf
}
sha256sums=('9987e0f6b1f66311390f807a0c18ad9c90652b5097cff17b3dcbeabdd89f8d32'
  '290ab6ad8ad388b0911e2aad4a5b297d273616698065f47ee70e66358405ba8f')
