# $Id$
# Maintainer: Eden Rose(endlesseden) <eenov1988 "at"  gmail.com >
# Contributor: Alexandre Demers <alexandre.f.demers@gmail.com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>
# AUR dependencies
# ----------------
# libilbc kvazaar chromaprint-fftw libbs2b openh264 shine vo-amrwbenc
# nut-multimedia-git xavs libmfx-git libopenmpt-svn zimg-git

# AUR make dependencies
# ---------------------
# flite1

_pkgbasename=ffmpeg-semifull-git
pkgname=lib32-$_pkgbasename
pkgver=N.86539.g155f071bad
pkgrel=1
pkgdesc="Record, convert and stream audio and video (Git version with all possible libs)  [32 bit]"
arch=('i686' 'x86_64')
url="http://www.ffmpeg.org/"
license=('GPL3')
depends=("$_pkgbasename"
      'lib32-alsa-lib'
      'lib32-fontconfig'
      'lib32-fribidi'
      'lib32-gnutls'
      'lib32-gsm'
      'lib32-lame'
      'lib32-libass'
      'lib32-libavc1394'
      'lib32-libbluray'
      'lib32-libiec61883'
      'lib32-libmodplug'
      'lib32-libpulse'
      'lib32-jack'
      'lib32-libtheora'
      'lib32-libva'
      'lib32-libvdpau'
      'lib32-libwebp'
      'lib32-opencore-amr'
      'lib32-openjpeg'
      'lib32-openjpeg2'
      'lib32-opus'
      'lib32-schroedinger'
      'lib32-sdl2'
      'lib32-speex'
      'lib32-v4l-utils'
      'lib32-libxv'
      'lib32-xvidcore'
      'lib32-zlib'
      'lib32-libvorbis'
      'lib32-libx264'
      'lib32-libvpx'
    'lib32-bzip2' 'lib32-xz' 'lib32-libpng' 'lib32-chromaprint-fftw'  'lib32-frei0r-plugins'
    'lib32-libgcrypt' 'lib32-gmp' 'lib32-glibc' 'lib32-ladspa' 'lib32-libbs2b' 'lib32-libcaca' 'lib32-celt'
    'libcdio-paranoia' 'libdc1394' 'libfdk-aac' 'freetype2' 'libgme' 'gsm'
    'lib32-libilbc' 'lib32-kvazaar'  'lib32-nut-multimedia-git'
    'lib32-opencv' 'lib32-openh264'  'lib32-libopenmpt-svn'  'lib32-pulseaudio'
    'lib32-rubberband' 'lib32-rtmpdump' 'lib32-shine' 'lib32-smbclient' 'lib32-snappy' 'lib32-libsoxr'
    'lib32-libssh' 'lib32-tesseract' 'lib32-vid.stab' 'lib32-vo-amrwbenc'
    'lib32-wavpack' 'lib32-libwebp' 'lib32-x265' 'lib32-libxcb' 'lib32-zimg'
    'lib32-zeromq' 'lib32-zvbi' 'lib32-openal' 'lib32-libdrm' 'lib32-libva-intel-driver' 'lib32-opencl-icd-loader'
    'lib32-libvdpau' 'lib32-mesa' 'lib32-openssl' 'lib32-xavs'  'lib32-libmfx-git'
    'lib32-libomxil-bellagio'
)
makedepends=('lib32-ladspa' 'lib32-libvdpau' 'yasm' 'lib32-flite')
optdepends=('lib32-ladspa: LADSPA filters')
provides=(
      'libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
      'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
      'libswscale.so'
)
conflicts=(
    'lib32-ffmpeg' 'lib32-ffmpeg-git' 'lib32-ffmpeg-full' 'lib32-ffmpeg-full-extra' 'lib32-ffmpeg-full-nvenc'
    'lib32-ffmpeg-libfdk_aac')
source=("$pkgname"::'git://source.ffmpeg.org/ffmpeg.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	
	# Git, tags available
	        
	# Method showing version based on FFmpeg Git versioning system
	printf "%s" "$(git describe --tags --match N | tr '-' '.')"
}

build() {
	cd "${srcdir}/${pkgname}"
	
	#32bit
	    _cuda=""
	    _cudainc=""
	    _cudalib=""
	    _cuvid=""
	    _libnpp=""
	    _intelsdklib=""
	#32bit
	
	msg2 "Running ffmpeg configure script. Please wait..."
	 export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	
	./configure \
            --prefix='/usr' \
            --libdir=/usr/lib32 \
            --bindir=/usr/bin32 \
            --includedir=/usr/include32 \
            --sharedir=/usr/share32 \
            --shlibdir=/usr/lib32 \
            --cc="gcc -m32" \
	        --extra-cflags="${_cudainc} -ftree-vectorize" \
	        --extra-ldflags="${_cudalib} ${_intelsdklib}" \
	        \
	        --enable-hardcoded-tables \
	        --enable-rpath \
	        --enable-gpl \
	        --enable-version3 \
	        --enable-nonfree \
	        --enable-shared \
            --disable-debug \
            --disable-static \
            --disable-stripping \
	        --enable-gray \
	        --enable-avresample \
	        \
	        --enable-avisynth \
	        --enable-bzlib \
	        --enable-chromaprint \
	        --enable-frei0r \
	        --enable-gcrypt \
	        --enable-gmp \
	        --enable-gnutls \
	        --enable-iconv \
	        --enable-ladspa \
	        --enable-libass \
	        --enable-libbluray \
	        --enable-libbs2b \
	        --enable-libcaca \
	        --enable-libcelt \
	        --enable-libcdio \
	        --enable-libdc1394 \
	        --enable-libfdk-aac \
	        --enable-fontconfig \
	        --enable-libfreetype \
	        --enable-libfribidi \
	        --enable-libgme \
	        --enable-libgsm \
	        --enable-libiec61883 \
	        --enable-libilbc \
	        --enable-libkvazaar \
	        --enable-libmodplug \
	        --enable-libmp3lame \
	        --enable-libopencore-amrnb \
	        --enable-libopencore-amrwb \
	        --enable-libopencv \
	        --enable-libopenh264 \
	        --enable-libopenjpeg \
	        --enable-libopenmpt \
	        --enable-libopus \
	        --enable-libpulse \
	        --enable-librubberband \
	        --enable-librtmp  \
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
	        --enable-libxcb-shm \
	        --enable-libxcb-xfixes \
	        --enable-libxcb-shape \
	        --enable-libxvid \
	        --enable-libzimg \
	        --enable-libzmq \
	        --enable-libzvbi \
	        --enable-lzma \
	        --enable-openal \
	        --enable-opencl \
	        --enable-opengl \
	        --enable-openssl \
	        --enable-sdl2 \
	        --enable-xlib \
	        --enable-zlib \
	        \
	        $_cuda \
	        $_cuvid \
	        --enable-libmfx \
	        $_libnpp \
	        --enable-omx \
	        --enable-omx-rpi \
	        --enable-vaapi \
	        --enable-vdpau \
	        --enable-videotoolbox \
	        \
            --enable-avisynth \
            --enable-avresample \
            --enable-fontconfig \
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
            --enable-libopenjpeg \
            --enable-libopus \
            --enable-libpulse \
            --enable-libschroedinger \
            --enable-libspeex \
            --enable-libtheora \
            --enable-libv4l2 \
            --enable-libvorbis \
            --enable-libvpx \
            --enable-libwebp \
            --enable-libx264 \
            --enable-libxcb \
            --enable-libxvid 
	
	make
	
	make tools/qt-faststart
}

package() {
	cd "${srcdir}/${pkgname}"
	
	make DESTDIR="$pkgdir/" install
	#if [ -e "$pkgdir"/usr/include ]; then
	#mv "$pkgdir"/usr/include 
	#fi
	rm -rf "$pkgdir"/usr/{include,share,bin}
	install -D -m755 tools/qt-faststart "${pkgdir}/usr/bin/qt-faststart"
}
