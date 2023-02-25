# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

pkgname=ffmpeg-full
pkgver=5.1.2
pkgrel=4
pkgdesc='Complete solution to record, convert and stream audio and video (all possible features including libfdk-aac)'
arch=('x86_64')
url='https://www.ffmpeg.org/'
license=('custom: nonfree and unredistributable')
depends=('alsa-lib' 'aom' 'aribb24' 'avisynthplus' 'bzip2' 'celt' 'codec2' 'cuda'
         'dav1d' 'fontconfig' 'freetype2' 'fribidi' 'glslang' 'frei0r-plugins' 'gmp'
         'gnutls' 'gsm' 'intel-media-sdk' 'jack' 'kvazaar' 'ladspa' 'lame' 'libavc1394'
         'lcms2' 'lensfun-git' 'libass' 'libbluray' 'libbs2b' 'libcaca' 'libcdio-paranoia'
         'libdc1394' 'libdrm' 'libfdk-aac' 'libgme' 'libgl' 'libgcrypt' 'libiec61883'
         'libilbc' 'libjxl' 'libmodplug' 'libmysofa' 'libomxil-bellagio' 'libplacebo'
         'libpulse' 'librabbitmq-c' 'librsvg' 'libssh' 'libsoxr' 'libtheora' 'libva'
         'libvdpau' 'libvorbis' 'libvpx' 'libx11' 'libxcb' 'libxext' 'libxml2' 'libxv'
         'libwebp' 'lilv' 'lv2' 'ocl-icd' 'openal' 'opencore-amr' 'openh264' 'openjpeg2'
         'libopenmpt' 'opus' 'rav1e' 'rubberband' 'rtmpdump' 'sdl2' 'smbclient' 'snappy'
         'sndio' 'speex' 'spirv-tools' 'srt' 'svt-av1' 'svt-hevc' 'svt-vp9' 'tesseract'
         'twolame' 'v4l-utils' 'vapoursynth' 'vid.stab' 'vmaf' 'vulkan-icd-loader' 'x264'
         'x265' 'xvidcore' 'xz' 'zeromq' 'zimg' 'zlib' 'zvbi'
         'chromaprint-fftw' 'davs2' 'flite1' 'libklvanc-git' 'librist'
         'rockchip-mpp' 'shine' 'uavs3d-git' 'vo-amrwbenc' 'xavs' 'xavs2')
makedepends=('clang' 'amf-headers' 'ffnvcodec-headers' 'nasm' 'opencl-headers'
             'vulkan-headers' 'decklink-sdk')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libswscale.so' 'libswresample.so'
          'ffmpeg')
conflicts=('ffmpeg')
_svt_hevc_ver='b62f72e752243cee4104cfb41dc7ee409d3ac3e9'
_svt_vp9_ver='d9ef3cc13159143b9afc776c04f67cdfa6284046'
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        "010-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/master-0001-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch"
        #"020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
        "030-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-VP9/${_svt_vp9_ver}/ffmpeg_plugin/master-0001-Add-ability-for-ffmpeg-to-run-svt-vp9.patch"
        '040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch'
        '060-ffmpeg-fix-segfault-with-avisynthplus.patch'
        '070-ffmpeg-fix-v4l2-memory-leak.patch'::'https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/30aa0c3f4873a92c5e3da8ba8cf030de56bf4cf7'
        '080-ffmpeg-vulkan-headers-1.3.240-fix.patch'::'https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/eb0455d64690eed0068e5cb202f72ecdf899837c'
        'LICENSE')
sha256sums=('619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd052db9e440eef3dc'
            'SKIP'
            '4da3826aa370572273ef9fb4c0bf2c93a840595b07a671a0412ad0dc9ed8d689'
            'e310eedb3dc88c8ad6ffcd6cb6bde1f593ded330ea99b0356724c9d22bcfde4c'
            '2df82046908015bf26bc1303275cf52ba01fa380029a54ea6415373e389e423c'
            'b1d68f626168f2409a4b0987acf5b208e7ced2ddab49b11990a10f458d377e9a'
            '9e4e290378028cd4474c36d3e3a25f77d4f40424dbd3115632e20c5734b50979'
            '99369be480f6ccd9ba2964961141869ff362505e605cd9fe6ba78228ca1f788d'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

prepare() {
    rm -f "ffmpeg-${pkgver}/libavcodec/"libsvt_{hevc,vp9}.c
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/010-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"
    #patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/030-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/060-ffmpeg-fix-segfault-with-avisynthplus.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/070-ffmpeg-fix-v4l2-memory-leak.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/080-ffmpeg-vulkan-headers-1.3.240-fix.patch"
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
        --enable-lcms2 \
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
        --enable-libjxl \
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
        --enable-libplacebo \
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
        --enable-libsvtav1 \
        --enable-libsvthevc \
        --enable-libsvtvp9 \
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
        --disable-pocketsphinx \
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
