# Contributor: Jeff Keyte <jeff@keyte.me>

pkgname=openpht-ffmpeg
pkgver=2.8.7
pkgrel=2
pkgdesc='FFMPEG modified for OpenPHT 1.6'
arch=('i686' 'x86_64')
url='http://ffmpeg.org'
license=('GPL2')
depends=('alsa-lib' 'avahi' 'boost-libs' 'curl' 'expat' 'freetype2' 'fribidi'
         'gcc-libs' 'glew' 'glibc' 'glu' 'libcdio' 'libgl' 'libjpeg' 'libmad'
         'libmicrohttpd' 'libmpeg2' 'libpng' 'libpulse' 'libsamplerate' 'llvm-libs'
         'libssh' 'libtiff' 'libusb-compat' 'libva' 'libvdpau' 'libx11'
         'libxext' 'libxrandr' 'lzo' 'pcre' 'python2' 'sdl' 'sdl_image'
         'sdl_mixer' 'sqlite' 'smbclient' 'taglib' 'tinyxml' 'yajl' 'zlib')
makedepends=('boost' 'cmake' 'doxygen' 'git' 'java-environment'
             'libcec' 'libplist' 'nasm' 'swig' 'unzip' 'zip')
optdepends=('libplist: AirPlay support'
            'libcec: Pulse-Eight USB-CEC adapter support'
            'pulseaudio: PulseAudio support')
source=("http://ffmpeg.org/releases/ffmpeg-2.8.7.tar.bz2"
	'ffmpeg-2.8-kodi.patch'
	'ffmpeg-2.8-Resolve-plex-direct-domains.patch'
'ffmpeg-99.0011-mpeg4video-Signal-unsupported-GMC-with-more-than-one.patch'
'ffmpeg-Speed_up_wtv_index_creation.patch'
'openpht.conf'
)
prepare() {
  mkdir ffmpeg-2.8.7/patches
  cp *.patch ffmpeg-2.8.7/patches
}

build() {
  cd ffmpeg-2.8.7
  ./configure --prefix="/usr/local" --disable-altivec --disable-amd3dnow --disable-avisynth --disable-crystalhd --disable-debug --disable-decoder=mpeg_xvmc --disable-devices --disable-doc --disable-dxva2 --disable-encoders --disable-extra-warnings --disable-ffmpeg --disable-ffplay --disable-ffprobe --disable-ffserver --disable-frei0r --disable-gray --disable-hardcoded-tables --disable-indevs --disable-libdc1394 --disable-libfaac --disable-libfreetype --disable-libgsm --disable-libmp3lame --disable-libnut --disable-libopencore-amrnb --disable-libopencore-amrwb --disable-libopencv --disable-libopenjpeg --disable-librtmp --disable-libschroedinger --disable-libspeex --disable-libtheora --disable-libvo-aacenc --disable-libvo-amrwbenc --disable-libvorbis --disable-libvpx --disable-libx264 --disable-libxavs --disable-libxvid --disable-memalign-hack --disable-mmi --disable-muxers --disable-nonfree --disable-outdevs --disable-small --disable-static --disable-symver --disable-vda --disable-version3 --disable-w32threads --disable-x11grab --enable-asm --enable-avcodec --enable-avdevice --enable-avfilter --enable-avformat --enable-bsfs --enable-bzlib --enable-dct --enable-demuxers --enable-fft --enable-filters --enable-gpl --enable-hwaccels --enable-libvorbis --enable-logging --enable-mdct --enable-muxer=adts --enable-muxer=ogg --enable-muxer=spdif --enable-network --enable-optimizations --enable-parsers --enable-pic --enable-postproc --enable-protocol=http --enable-pthreads --enable-rdft --enable-runtime-cpudetect --enable-shared --enable-stripping --enable-swscale --enable-swscale-alpha --enable-vaapi --enable-vdpau --enable-yasm --enable-zlib --host-libs=-lm
  make
}

package() {
  cd ffmpeg-2.8.7
  make DESTDIR="${pkgdir}" install
  cp openpht.conf /etc/ld.so.conf.d
}
sha256sums=('8777ce4a335640fdd13680ba423ef6da330ff5071bfbe27cdbb452379167efe5'
'f89a26cb409bab1ac00106db008eccf72c6390e04d7cde2a63fbb1f2e9fbc669'
'ca7eca1b9476c93efbdea457b64b0e5d925ad437f79168112aae52319d59d155'
'fa78aa79ff861edbb8b6443978a0da60c4241f7a7f3888b242031ba916fa7514'
'd1191e3e3fc980535e4835b5ef9b52fd15a14b58ef56ac6d2710bd589ce94b40'
'290ab6ad8ad388b0911e2aad4a5b297d273616698065f47ee70e66358405ba8f')
