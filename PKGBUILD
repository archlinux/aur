# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>
# Original: Daniel Bermond <dbermond@archlinux.org> > https://aur.archlinux.org/packages/ffmpeg-full-git
# Contributor: Marko Korhonen <reekymarko at reekynet.com>
# Contributor: Bruno Filipe < gmail-com: bmilreu >

pkgname=ffmpeg-amd-full-git
_srcname=ffmpeg
pkgver=4.3.r97205.g3935c891e9
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video (all possible features for AMD; git version)'
arch=('i686' 'x86_64')
url='https://www.ffmpeg.org/'
license=('custom: nonfree and unredistributable')
depends=(
    # official repositories:
        'glibc' 'alsa-lib' 'jack' 'libpng'
        'bzip2' 'frei0r-plugins' 'libgcrypt' 'gmp' 'gnutls' 'ladspa' 'libass' 'aom'
        'libbluray' 'libbs2b' 'libcaca' 'celt' 'libcdio-paranoia' 'libdc1394'
        'libavc1394' 'libfdk-aac' 'fontconfig' 'freetype2' 'fribidi' 'libgme' 'gsm'
        'libiec61883' 'lensfun' 'libmodplug' 'lame' 'opencore-amr' 'openjpeg2' 'opus'
        'pulseaudio' 'librsvg' 'rubberband' 'rtmpdump' 'snappy' 'libsoxr'
        'speex' 'srt' 'libssh' 'tensorflow' 'tesseract' 'libtheora' 'twolame'
        'v4l-utils' 'vid.stab' 'libvorbis' 'libvpx' 'wavpack' 'libwebp' 'libx264.so'
        'x265' 'libxcb' 'xvidcore' 'libxml2' 'zimg' 'zeromq' 'zvbi' 'lv2' 'lilv' 'xz'
        'openal' 'ocl-icd' 'libgl' 'sndio' 'sdl2' 'vapoursynth' 'libxv' 'libx11'
        'libxext' 'zlib' 'libomxil-bellagio' 'libva' 'libdrm' 'libvdpau' 'dav1d'
    # AUR:
        'avisynthplus' 'chromaprint-fftw' 'codec2' 'davs2' 'flite1-patched' 'libilbc'
        'libklvanc-git' 'kvazaar' 'openh264' 'libopenmpt-svn' 'shine' 'vo-amrwbenc'
        'xavs' 'xavs2' 'libmysofa-git'
)
makedepends=(
    # official repositories:
        'git' 'nasm' 'opencl-headers'
)
makedepends_x86_64=(
    # AUR:
        'vmaf'
)
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libavresample.so' 'libswscale.so'
          'libswresample.so' 'ffmpeg' 'ffmpeg-full' 'ffmpeg-git')
conflicts=('ffmpeg')
source=('git+https://git.ffmpeg.org/ffmpeg.git'
        'LICENSE')
sha256sums=('SKIP'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')

pkgver() {
    cd "$_srcname"
    
    local _version
    local _revision
    local _shorthash
    
    _version="$(  git describe  --tags --long      | awk -F'-' '{ printf $1 }' | sed 's/^n//')"
    _revision="$( git describe  --tags --match 'N' | awk -F'-' '{ printf $2 }')"
    _shorthash="$(git rev-parse --short HEAD)"
    
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    cd "$_srcname"
    
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    ./configure \
        --prefix='/usr' \
        --extra-cflags="$_cflags" \
        --extra-ldflags="$_ldflags" \
        --disable-rpath \
        --enable-gpl \
        --enable-version3 \
        --enable-nonfree \
        --enable-shared \
        --disable-static \
        --disable-stripping \
        --enable-gray \
        --enable-avresample \
        --enable-alsa \
        --enable-avisynth \
        --enable-bzlib \
        --enable-chromaprint \
        --enable-frei0r \
        --enable-gcrypt \
        --enable-gmp \
        --enable-gnutls \
        --enable-iconv \
        --enable-ladspa \
        --enable-libaom \
        --enable-libass \
        --enable-libbluray \
        --enable-libbs2b \
        --enable-libcaca \
        --enable-libcelt \
        --enable-libcdio \
        --enable-libcodec2 \
        --enable-libdav1d \
        --enable-libdavs2 \
        --enable-libdc1394 \
        --enable-libfdk-aac \
        --enable-libflite \
        --enable-fontconfig \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libgme \
        --enable-libgsm \
        --enable-libiec61883 \
        --enable-libilbc \
        --enable-libjack \
        --enable-libklvanc \
        --enable-libkvazaar \
        --enable-liblensfun \
        --enable-libmodplug \
        --enable-libmp3lame \
        --enable-libopencore-amrnb \
        --enable-libopencore-amrwb \
        --disable-libopencv \
        --enable-libopenh264 \
        --enable-libopenjpeg \
        --enable-libopenmpt \
        --enable-libopus \
        --enable-libpulse \
        --enable-librsvg \
        --enable-librubberband \
        --enable-librtmp  \
        --enable-libshine \
        --disable-libsmbclient \
        --enable-libsnappy \
        --enable-libsoxr \
        --enable-libspeex \
        --disable-libsrt \
        --enable-libssh \
        --enable-libtensorflow \
        --enable-libtesseract \
        --enable-libtheora \
        --disable-libtls \
        --enable-libtwolame \
        --enable-libv4l2 \
        --enable-libvidstab \
        --enable-libvmaf \
        --enable-libvo-amrwbenc \
        --enable-libvorbis \
        --enable-libvpx \
        --enable-libwavpack \
        --enable-libwebp \
        --enable-libx264 \
        --enable-libx265 \
        --enable-libxavs \
        --enable-libxavs2 \
        --enable-libxcb \
        --enable-libxcb-shm \
        --enable-libxcb-xfixes \
        --enable-libxcb-shape \
        --enable-libxvid \
        --enable-libxml2 \
        --enable-libzimg \
        --enable-libzmq \
        --enable-libzvbi \
        --enable-lv2 \
        --enable-lzma \
        --disable-mbedtls \
        --enable-libmysofa \
        --enable-openal \
        --enable-opencl \
        --enable-opengl \
        --disable-openssl \
        --enable-sndio \
        --enable-sdl2 \
        --enable-vapoursynth \
        --enable-xlib \
        --enable-zlib \
        --enable-libdrm \
        --enable-omx \
        --enable-v4l2-m2m \
        --enable-vaapi \
        --enable-vdpau \
		--extra-cflags='-I/usr/include/tensorflow'
        
    make
    make tools/qt-faststart
}

package() {
    cd "$_srcname"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m755 tools/qt-faststart  -t "${pkgdir}/usr/bin"
    install -D -m644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
