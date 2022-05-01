# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>
# Original: Daniel Bermond <dbermond@archlinux.org> > https://aur.archlinux.org/packages/ffmpeg-full
# Contributor: Marko Korhonen <reekymarko at reekynet.com>
# Contributor: Bruno Filipe < gmail-com: bmilreu >

pkgname=ffmpeg-amd-full
pkgver=5.0.1
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video (all possible features for AMD)'
arch=('x86_64')
url='https://www.ffmpeg.org/'
license=('custom: nonfree and unredistributable')
depends=(
    # official repositories:
        'alsa-lib' 'avisynthplus' 'bzip2' 'frei0r-plugins' 'libgcrypt' 'gmp' 'gnutls'
        'ladspa' 'libass' 'aom' 'aribb24' 'libbluray' 'libbs2b' 'libcaca' 'celt'
        'libcdio-paranoia' 'chromaprint' 'codec2' 'dav1d' 'libdc1394' 'libavc1394'
        'libfdk-aac' 'fontconfig' 'freetype2' 'fribidi' 'glslang' 'spirv-tools' 'libgme'
        'gsm' 'libiec61883' 'libilbc' 'jack' 'kvazaar' 'libmodplug' 'lame'
        'opencore-amr' 'openjpeg2' 'libopenmpt' 'opus' 'libpulse' 'librabbitmq-c' 'rav1e' 'librsvg'
        'rubberband' 'rtmpdump' 'smbclient' 'snappy' 'libsoxr' 'speex' 'srt' 'libssh'
        'svt-hevc' 'svt-av1' 'svt-vp9' 'tesseract' 'libtheora' 'twolame'
        'v4l-utils' 'vid.stab' 'vmaf' 'libvorbis' 'libvpx' 'libwebp' 'x264'
        'x265' 'libxcb' 'xvidcore' 'libxml2' 'zimg' 'zeromq' 'zvbi' 'lv2' 'lilv' 'xz'
        'libmysofa' 'openal' 'ocl-icd' 'libgl' 'sndio' 'sdl2' 'vapoursynth'
        'vulkan-icd-loader' 'libxv' 'libx11'  'libxext' 'zlib'
        'libomxil-bellagio' 'libdrm' 'libva' 'libvdpau'
    # AUR:
        'davs2' 'flite1' 'libklvanc-git' 'openh264'
        'librist' 'shine' 'uavs3d-git' 'vo-amrwbenc' 'xavs' 'xavs2' 
        'pocketsphinx' 'lensfun-git'
)
makedepends=(
    # official repositories:
        'nasm' 'opencl-headers' 'vulkan-headers' 'clang' 'amf-headers'
    # AUR:
        'decklink-sdk'
)
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libswscale.so'
          'libswresample.so' 'ffmpeg' 'ffmpeg-full')
conflicts=('ffmpeg')
_svt_hevc_ver='6e677e0017cb27bfdd62effcfd2a0dc83b48bb16'
_svt_vp9_ver='41819e71950883655dcfa2a8b60cf0a75d50db74'
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        '010-ffmpeg-vmaf2.x.patch'
        #"020-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/master-0001-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch"
        #"030-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
        #"040-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-VP9/${_svt_vp9_ver}/ffmpeg_plugin/master-0001-Add-ability-for-ffmpeg-to-run-svt-vp9.patch"
        "050-add-av_stream_get_first_dts-for-chromium.patch"
        'LICENSE')
sha256sums=('ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b'
            'SKIP'
            '42bd572442a4eba4e9559953c72f9e980b78286ab288ac01e659be39d8bc7298'
            #'778030cdd6a097c013e562d3be091280ff92fbd625e5336cd075fbee93589ed0'
            #'837cac5a64234f34d136d18c8f7dc14203cdea11406fdb310cef2f62504d9e0c'
            #'1cdedb9e8c2912986d6acf20dd9d8ef0f1e21995d9b1898120dc55b714b4de0d'
            '91973c465f01446a999f278f0c2a3763304994dba1ac35de0e4c72f12f39409e'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

prepare() {
    rm -f "ffmpeg-${pkgver}/libavcodec/"libsvt_{hevc,vp9}.c
    #sed -i 's/general.texi/general_contents.texi/g' "030-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/010-ffmpeg-vmaf2.x.patch"
    #patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/020-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"
    #patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/030-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    #patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/040-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"
    # https://crbug.com/1251779
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/050-add-av_stream_get_first_dts-for-chromium.patch"
}

build() {
    cd "ffmpeg-${pkgver}"
    
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    ./configure \
        --prefix='/usr' \
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
        --disable-librist \
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
        --disable-cuda-nvcc \
        --disable-cuda-llvm \
        --disable-cuvid \
        --disable-ffnvcodec \
        --enable-libdrm \
        --disable-libmfx \
        --disable-libnpp \
        --disable-nvdec \
        --disable-nvenc \
        --enable-omx \
        --disable-rkmpp \
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
