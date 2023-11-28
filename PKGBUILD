# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>
# Original: Daniel Bermond <dbermond@archlinux.org> > https://aur.archlinux.org/packages/ffmpeg-full-git
# Contributor: Marko Korhonen <reekymarko at reekynet.com>
# Contributor: Bruno Filipe < gmail-com: bmilreu >

pkgname=ffmpeg-amd-full-git
_srcname=ffmpeg
pkgver=6.2.r112865.g3bca828d39
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video (all possible features for AMD; git version)'
arch=('x86_64')
url='https://www.ffmpeg.org/'
license=('custom: nonfree and unredistributable')
depends=('alsa-lib' 'aom' 'aribb24' 'avisynthplus' 'bzip2' 'celt' 'codec2'
         'dav1d' 'fontconfig' 'freetype2' 'fribidi' 'glslang' 'frei0r-plugins' 'gmp'
         'gnutls' 'gsm' 'harfbuzz' 'jack' 'kvazaar' 'ladspa' 'lame' 'libavc1394'
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
         'libaribcaption' 'chromaprint-fftw' 'davs2' 'flite1' 'libklvanc' 'librist'
         'opencv2' 'shine' 'uavs3d-git' 'vo-amrwbenc' 'xavs' 'xavs2' 'xevd' 'xeve')
makedepends=('git' 'clang' 'amf-headers' 'nasm' 'opencl-headers'
             'vulkan-headers' 'decklink-sdk')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libswscale.so'
          'libswresample.so' 'ffmpeg' 'ffmpeg-full' 'ffmpeg-git')
conflicts=('ffmpeg')
_svt_hevc_ver='6cca5b932623d3a1953b165ae6b093ca1325ac44'
_svt_vp9_ver='43ef8e5e96932421858762392adbbab57c84aebf'
source=("git+https://git.ffmpeg.org/ffmpeg.git"
        "005-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"
        "010-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/master-0001-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch"
        #"020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
        "030-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-VP9/${_svt_vp9_ver}/ffmpeg_plugin/master-0001-Add-ability-for-ffmpeg-to-run-svt-vp9.patch"
        "040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
        "060-ffmpeg-fix-segfault-with-avisynthplus.patch"
        "LICENSE")
sha256sums=('SKIP'
            '7d7a53ee6826acf44d6729d337f30fa8ebb85011a2793261575b7bad230835cb'
            'e8fdc940474f3819b9a8d30cab8164774584c051322acb6194bcb03d56e8175a'
            #'a164ebdc4d281352bf7ad1b179aae4aeb33f1191c444bed96cb8ab333c046f81'
            '0433016c8523c7ce159523946a76c8fa06a926f33f94b70e8de7c2082d14178c'
            '7d5ce8058b143bae1be10a06d79ac0f1a72daf00cf648309450d83bea249a6b1'
            '0e277c0d5e33612ca7a11025958133b17bfbe23168b0aee5bd07f674f6fd7440'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')

prepare() {
    rm -f ffmpeg/libavcodec/libsvt_{hevc,vp9}.c
    cp --remove-destination "$(readlink "010-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch")" \
        "010-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"
    patch -Np1 -i "005-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/010-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"
    #patch -d ffmpeg -Np1 -i "${srcdir}/020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/030-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/060-ffmpeg-fix-segfault-with-avisynthplus.patch"
}

pkgver() { 
    printf '%s.r%s.g%s' "$(git -C ffmpeg describe --tags --long | awk -F'-' '{ sub(/^n/, "", $1); print $1 }')" \
                        "$(git -C ffmpeg describe --tags --match 'N' | awk -F'-' '{ print $2 }')" \
                        "$(git -C ffmpeg rev-parse --short HEAD)"
}

build() {
    cd "$_srcname"
    
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    ./configure \
        --prefix='/usr' \
        --enable-lto \
         --cc=$CC \
         --cxx=$CXX \
        \
        --disable-rpath \
        --enable-gpl \
        --enable-version3 \
        --enable-nonfree \
        --enable-shared \
        --disable-static \
        --disable-stripping \
        --disable-htmlpages \
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
        --enable-libaribcaption \
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
        --enable-libfontconfig \
        --enable-libfreetype \
        --enable-libharfbuzz \
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
        --enable-libopencv \
        --enable-libopenh264 \
        --enable-libopenjpeg \
        --enable-libopenmpt \
        --disable-libopenvino \
        --enable-libopus \
        --enable-libplacebo \
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
        --enable-libxevd \
        --enable-libxeve \
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
    make -C ffmpeg DESTDIR="$pkgdir" install
    install -D -m755 ffmpeg/tools/qt-faststart -t "${pkgdir}/usr/bin"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
