# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

pkgname=ffmpeg-full
pkgver=5.0.1
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video (all possible features including libfdk-aac)'
arch=('x86_64')
url='https://www.ffmpeg.org/'
license=('custom: nonfree and unredistributable')
depends=(
    # official repositories:
        'alsa-lib' 'avisynthplus' 'bzip2' 'frei0r-plugins' 'libgcrypt' 'gmp' 'gnutls'
        'ladspa' 'libass' 'aom' 'aribb24' 'libbluray' 'libbs2b' 'libcaca' 'celt'
        'libcdio-paranoia' 'codec2' 'dav1d' 'libdc1394' 'libavc1394' 'libfdk-aac'
        'fontconfig' 'freetype2' 'fribidi' 'glslang' 'spirv-tools' 'libgme' 'gsm'
        'libiec61883' 'libilbc' 'jack' 'kvazaar' 'libmodplug' 'lame'
        'opencore-amr' 'openjpeg2' 'opus' 'libpulse' 'librabbitmq-c' 'rav1e' 'librsvg'
        'rubberband' 'rtmpdump' 'smbclient' 'snappy' 'libsoxr' 'speex' 'srt' 'libssh'
        'svt-hevc' 'svt-av1' 'svt-vp9' 'tesseract' 'libtheora' 'twolame'
        'v4l-utils' 'vid.stab' 'vmaf' 'libvorbis' 'libvpx' 'libwebp' 'x264' 'x265'
        'libxcb' 'xvidcore' 'libxml2' 'zimg' 'zeromq' 'zvbi' 'lv2' 'lilv' 'xz'
        'libmysofa' 'openal' 'ocl-icd' 'libgl' 'sndio' 'sdl2' 'vapoursynth'
        'vulkan-icd-loader' 'libxv' 'libx11' 'libxext' 'zlib' 'cuda'
        'libomxil-bellagio' 'libdrm' 'intel-media-sdk' 'libva' 'libvdpau'
    # AUR:
        'chromaprint-fftw' 'davs2' 'flite1' 'libklvanc-git' 'openh264'
        'libopenmpt-svn' 'librist' 'shine' 'uavs3d-git' 'vo-amrwbenc' 'xavs'
        'xavs2' 'pocketsphinx' 'rockchip-mpp' 'lensfun-git'
)
makedepends=(
    # official repositories:
        'nasm' 'opencl-headers' 'vulkan-headers' 'ffnvcodec-headers' 'clang'
        'amf-headers'
    # AUR:
        'decklink-sdk'
)
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libswscale.so' 'libswresample.so'
          'ffmpeg')
conflicts=('ffmpeg')
_svt_hevc_ver='111eef187fd7b91ad27573421c7238ef787e164f'
_svt_vp9_ver='308ef4464568a824f1f84c4491cb08ab4f535f6c'
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        "010-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/master-0001-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch"
        #"020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
        "030-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-VP9/${_svt_vp9_ver}/ffmpeg_plugin/master-0001-Add-ability-for-ffmpeg-to-run-svt-vp9.patch"
        '040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch'
        '050-ffmpeg-vmaf-2.x.patch'
        '060-ffmpeg-fix-segfault-with-avisynthplus.patch'
        '070-ffmpeg-libsvtav1-0.9.0-part1.patch'::'https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/c33b4048859a191acf9b6aa22acaea248a4eb18f'
        '080-ffmpeg-libsvtav1-0.9.0-part2.patch'::'https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/1dddb930aaf0cadaa19f86e81225c9c352745262'
        'LICENSE')
sha256sums=('ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b'
            'SKIP'
            'efd01f96c1f48ea599881dfc836d20ba18c758a3588d616115546912aebeb77f'
            '9565b3eed177ce5d109876f2a56f3781a2c7fae41e32601bf6ec805ea199d21b'
            '91973c465f01446a999f278f0c2a3763304994dba1ac35de0e4c72f12f39409e'
            'eb044a095ba72ebe63de53f15952aa0100bb27ee691cf3d3a205d5a597c72a7d'
            '887c2e440b159b7c3575a12eb17e1297b76f9468b65b96ef2674b7bb36b12fcf'
            '65a455c6ef110cd06196b48e53f36b87cb2a90fccfdd65fe25cd225b2524fa22'
            '9de88ea609fddf8437536b6cf7c9b4039bde4fa560977cdeba14b87b8dcca31c'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

prepare() {
    rm -f "ffmpeg-${pkgver}/libavcodec/"libsvt_{hevc,vp9}.c
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/010-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"
    #patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/030-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/050-ffmpeg-vmaf-2.x.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/060-ffmpeg-fix-segfault-with-avisynthplus.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/070-ffmpeg-libsvtav1-0.9.0-part1.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/080-ffmpeg-libsvtav1-0.9.0-part2.patch"
}

build() {
    cd "ffmpeg-${pkgver}"
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    ./configure \
        --prefix='/usr' \
        --extra-cflags='-I/opt/cuda/include' \
        --extra-ldflags='-L/opt/cuda/lib64' \
        --enable-lto \
        \
        --disable-rpath \
        --enable-gpl \
        --enable-version3 \
        --enable-nonfree \
        --enable-shared \
        --disable-static \
        --disable-stripping \
        --enable-gray \
        \
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
        --enable-libaribb24 \
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
        --enable-libglslang \
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
        --disable-libopenvino \
        --enable-libopus \
        --enable-libpulse \
        --enable-librabbitmq \
        --enable-librav1e \
        --enable-librist \
        --enable-librsvg \
        --enable-librubberband \
        --enable-librtmp  \
        --enable-libshine \
        --enable-libsmbclient \
        --enable-libsnappy \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libsrt \
        --enable-libssh \
        --enable-libsvthevc \
        --enable-libsvtav1 \
        --disable-libtensorflow \
        --enable-libtesseract \
        --enable-libtheora \
        --disable-libtls \
        --enable-libtwolame \
        --enable-libuavs3d \
        --enable-libv4l2 \
        --enable-libvidstab \
        --enable-libvmaf \
        --enable-libvo-amrwbenc \
        --enable-libvorbis \
        --enable-libvpx \
        --enable-libsvtvp9 \
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
        --enable-decklink \
        --disable-mbedtls \
        --enable-libmysofa \
        --enable-openal \
        --enable-opencl \
        --enable-opengl \
        --disable-openssl \
        --enable-pocketsphinx \
        --enable-sndio \
        --enable-sdl2 \
        --enable-vapoursynth \
        --enable-vulkan \
        --enable-xlib \
        --enable-zlib \
        \
        --enable-amf \
        --enable-cuda-nvcc \
        --enable-cuda-llvm \
        --enable-cuvid \
        --enable-ffnvcodec \
        --enable-libdrm \
        --enable-libmfx \
        --enable-libnpp \
        --enable-nvdec \
        --enable-nvenc \
        --enable-omx \
        --enable-rkmpp \
        --enable-v4l2-m2m \
        --enable-vaapi \
        --enable-vdpau
    make
    make tools/qt-faststart
}

package() {
    make -C "ffmpeg-${pkgver}" DESTDIR="$pkgdir" install
    install -D -m755 "ffmpeg-${pkgver}/tools/qt-faststart" -t "${pkgdir}/usr/bin"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
