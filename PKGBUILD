# Maintainer: Jesse Bryan <jesse@winneon.moe>
pkgname=ffmpeg-full3.4
pkgver=3.4.2
pkgrel=1
pkgdesc="FFmpeg 3.4, designed to fix linking issues with packages that require this version of FFmpeg."
arch=("x86_64")
url="https://ffmpeg.org/"
license=("custom: nonfree and unredistributable")
depends=(
    # official repositories:
        "glibc" "alsa-lib" "jack" "libpng"
        "bzip2" "frei0r-plugins" "libgcrypt" "gmp" "gnutls" "ladspa" "libass"
        "libbluray" "libcaca" "celt" "libcdio-paranoia" "libdc1394" "libavc1394"
        "libfdk-aac" "fontconfig" "freetype2" "fribidi" "libgme" "gsm" "libiec61883"
        "libmodplug" "lame" "opencore-amr" "opencv" "openjpeg2" "opus" "pulseaudio"
        "librsvg" "rubberband" "rtmpdump" "smbclient" "snappy" "libsoxr" "speex"
        "libssh" "tesseract" "libtheora" "twolame" "v4l-utils" "vid.stab" "libvorbis"
        "libvpx" "wavpack" "libwebp" "libx264.so" "x265" "libxcb" "xvidcore" "libxml2"
        "zimg" "zeromq" "zvbi" "xz" "openal" "opencl-icd-loader" "mesa" "openssl"
        "sdl2" "libx11" "zlib" "libomxil-bellagio" "libva" "libdrm" "libvdpau"
    # AUR:
        "chromaprint-fftw" "libbs2b" "flite1" "libilbc" "kvazaar" "openh264"
        "libopenmpt-svn" "sndio" "shine" "vo-amrwbenc" "xavs" "libmysofa" "rockchip-mpp"
)
optdepends_x86_64=(
    # AUR:
        "intel-media-sdk: for Intel QSV support (experimental)"
)
makedepends=(
    # official repositories:
        "nasm" "opencl-headers"
    # AUR:
        "blackmagic-decklink-sdk" "libmfx"
)
provides=(
    "libavutil.so=55" "libavcodec.so=57" "libavformat.so=57" "libavdevice.so=57"
    "libavfilter.so=6" "libavresample.so=3" "libswscale.so=4" "libswresample.so=2"
    "libpostproc.so=54"
)
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"
        "ffmpeg-full-rkmpp-build-fix.patch"
        "ffmpeg-full-rkmpp-remove-stream-start.patch"
        "LICENSE"
)
validpgpkeys=("FCF986EA15E6E293A5644F10B4322F04D67658D8")
sha256sums=("2b92e9578ef8b3e49eeab229e69305f5f4cbc1fdaa22e927fc7fca18acccd740"
            "142923fd02851343bfbfd31b201ba014dced8a8c8898373c72d71d30d59f5851"
            "cac8577126c3e49f8c915fa289f3f5aa624dc55f897b8b7a5613191bcfa9c097"
            "04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36")

prepare() {
    cd "ffmpeg-${pkgver}"

    patch -Np1 -i "${srcdir}/ffmpeg-full-rkmpp-build-fix.patch"
    patch -Np1 -i "${srcdir}/ffmpeg-full-rkmpp-remove-stream-start.patch"
}

build() {
    cd "ffmpeg-${pkgver}"

    msg2 "Running ffmpeg configure script. Please wait..."

    ./configure \
        --prefix="/usr" \
        --incdir="/usr/include/ffmpeg3.4" \
        --libdir="/usr/lib/ffmpeg3.4" \
        --shlibdir="/usr/lib/ffmpeg3.4" \
        --disable-rpath \
        --enable-gpl \
        --enable-version3 \
        --enable-nonfree \
        --enable-shared \
        --disable-static \
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
        --enable-jack \
        --enable-ladspa \
        --enable-libass \
        --enable-libbluray \
        --enable-libbs2b \
        --enable-libcaca \
        --enable-libcelt \
        --enable-libcdio \
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
        --enable-librsvg \
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
        --enable-libxml2 \
        --enable-libzimg \
        --enable-libzmq \
        --enable-libzvbi \
        --enable-lzma \
        --enable-decklink \
        --enable-libmysofa \
        --enable-openal \
        --enable-opencl \
        --enable-opengl \
        --enable-openssl \
        --enable-sndio \
        --enable-sdl2 \
        --enable-xlib \
        --enable-zlib \
        --enable-libdrm \
        --enable-libmfx \
        --enable-nvenc \
        --enable-omx \
        --enable-omx-rpi \
        --enable-rkmpp \
        --enable-vaapi \
        --enable-vdpau

    make
}

package() {
    cd "ffmpeg-${pkgver}"

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/usr/share"
    find "${pkgdir}/usr/bin" -type f -exec mv {} {}3.4 \;

    install -dm755 "${pkgdir}/etc/ld.so.conf.d"
    echo -e "/usr/lib/\n/usr/lib/ffmpeg3.4/"  > "${pkgdir}/etc/ld.so.conf.d/50-ffmpeg3.4.conf"

    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
