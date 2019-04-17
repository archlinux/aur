# Maintainer: Inochi Amaoto <libraryindexsky@gmail.com>

pkgname=mpv-full-build-git
pkgver=0.29.0.r306.g4e9dc60d9e
pkgrel=1
pkgdesc="Video player based on MPlayer/mplayer2 with all possible libs (uses statically linked ffmpeg with all possible libs). (GIT version )"
arch=('x86_64')
depends=(
         # official repositories:
         'alsa-lib'
         'aom'
         'bzip2'
         'celt'
         'dav1d'
         'desktop-file-utils'
         'fontconfig'
         'freetype2'
         'frei0r-plugins'
         'fribidi'
         'glibc'
         'gmp'
         'gnutls'
         'gsm'
         'hicolor-icon-theme'
         'jack'
         'jack2'
         'ladspa'
         'lame'
         'lcms2'
         'lensfun'
         'libarchive'
         'libass'
         'libavc1394'
         'libbluray'
         'libbs2b'
         'libcaca'
         'libcdio-paranoia'
         'libdc1394'
         'libdrm'
         'libdvdnav'
         'libfdk-aac'
         'libgcrypt'
         'libgl'
         'libglvnd'
         'libgme'
         'libiec61883'
         'libmodplug'
         'libomxil-bellagio'
         'libpng'
         'libpulse'
         'librsvg'
         'libsoxr'
         'libssh'
         'libtheora'
         'libva'
         'libvdpau'
         'libvorbis'
         'libvpx'
         'libwebp'
         'libx11'
         'libxcb'
         'libxext'
         'libxinerama'
         'libxkbcommon'
         'libxml2'
         'libxrandr'
         'libxss'
         'libxv'
         'lilv'
         'luajit'
         'lv2'
         'ocl-icd'
         'openal'
         'opencore-amr'
         'openjpeg2'
         'opus'
         'pulseaudio'
         'rtmpdump'
         'rubberband'
         'sdl2'
         'smbclient'
         'snappy'
         'sndio'
         'speex'
         'srt'
         'tensorflow'
         'tesseract'
         'twolame'
         'uchardet'
         'v4l-utils'
         'vid.stab'
         'vulkan-icd-loader'
         'wavpack'
         'wayland'
         'x264'
         'x265'
         'xdg-utils'
         'xvidcore'
         'xz'
         'zeromq'
         'zimg'
         'zlib'
         'zvbi'

         # AUR:
         'chromaprint-fftw'
         'codec2'
         'crossc'
         'davs2'
         'flite1-patched'
         'kvazaar'
         'libilbc'
         'libklvanc-git'
         'libmysofa-git'
         'libopenmpt-svn'
         'mujs'
         'openh264'
         'rockchip-mpp'
         'rsound'
         'shaderc-git'
         'shine'
         'vo-amrwbenc'
         'xavs'
         'xavs2'
         )
license=('GPL2' 'GPL3' 'LGPL3' 'LGPL2.1' 'BSD' 'custom')
url='http://mpv.io'
makedepends=(
             'git'
             'mesa'
             'python-docutils'
             'nasm'
             'ladspa'
             'fontconfig'
             'vulkan-headers'
             'opencl-headers'
             'wayland-protocols'
             'ffnvcodec-headers'
             )
optdepends=(
            'mpv-bash-completion-git: Additional completion definitions for Bash users'
            'nvidia-utils: for hardware accelerated video decoding with CUDA'
            'youtube-dl: Another way to view youtuve videos with mpv'
            'zsh-completions: Additional completion definitions for Zsh users'
            )
provides=('mpv' 'mpv-git' 'mpv-build-git')
conflicts=('mpv' 'mpv-git' 'mpv-build-git')
options=('!emptydirs')
source=('git+https://github.com/mpv-player/mpv-build.git'
        'git+https://github.com/mpv-player/mpv.git'
        'git+https://github.com/ffmpeg/ffmpeg.git'
        'git+https://github.com/libass/libass.git'
        'LICENSE'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36'
            )
backup=('etc/mpv/encoding-profiles.conf')

if [ -f /usr/lib/libvapoursynth.so ]; then
  depends+=('vapoursynth')
fi

pkgver() {
  cd mpv
  git describe --tags | sed 's/v\(.*\)/\1/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd mpv-build
  rm -rf mpv
  rm -rf ffmpeg
  rm -rf libass
  git clone "${srcdir}/mpv"
  git clone "${srcdir}/ffmpeg"
  git clone "${srcdir}/libass"

  # Set ffmpeg/libass/mpv flags
  _ffmpeg_options=(
    '--disable-libopencv'
    '--disable-libtls'
    '--disable-mbedtls'
    '--disable-programs'
    '--enable-alsa'
    '--enable-avisynth'
    '--enable-bzlib'
    '--enable-chromaprint'
    '--enable-cuvid'
    '--enable-ffnvcodec'
    '--enable-fontconfig'
    '--enable-frei0r'
    '--enable-gcrypt'
    '--enable-gmp'
    '--enable-gnutls'
    '--enable-gpl'
    '--enable-gray'
    '--enable-iconv'
    '--enable-ladspa'
    '--enable-libaom'
    '--enable-libass'
    '--enable-libbluray'
    '--enable-libbs2b'
    '--enable-libcaca'
    '--enable-libcdio'
    '--enable-libcelt'
    '--enable-libcodec2'
    '--enable-libdavs2'
    '--enable-libdc1394'
    '--enable-libdrm'
    '--enable-libfdk-aac'
    '--enable-libflite'
    '--enable-libfreetype'
    '--enable-libfribidi'
    '--enable-libgme'
    '--enable-libgsm'
    '--enable-libiec61883'
    '--enable-libilbc'
    '--enable-libjack'
    '--enable-libklvanc'
    '--enable-libkvazaar'
    '--enable-liblensfun'
    '--enable-libmodplug'
    '--enable-libmp3lame'
    '--enable-libmysofa'
    '--enable-libopencore-amrnb'
    '--enable-libopencore-amrwb'
    '--enable-libopenh264'
    '--enable-libopenjpeg'
    '--enable-libopenmpt'
    '--enable-libopus'
    '--enable-libpulse'
    '--enable-librsvg'
    '--enable-librtmp'
    '--enable-librubberband'
    '--enable-libshine'
    '--enable-libsnappy'
    '--enable-libsoxr'
    '--enable-libspeex'
    '--enable-libsrt'
    '--enable-libssh'
    '--enable-libtensorflow'
    '--enable-libtesseract'
    '--enable-libtheora'
    '--enable-libtwolame'
    '--enable-libv4l2'
    '--enable-libvidstab'
    '--enable-libvo-amrwbenc'
    '--enable-libvorbis'
    '--enable-libvpx'
    '--enable-libwavpack'
    '--enable-libwebp'
    '--enable-libx264'
    '--enable-libx265'
    '--enable-libxavs'
    '--enable-libxavs2'
    '--enable-libxcb'
    '--enable-libxcb-shape'
    '--enable-libxcb-shm'
    '--enable-libxcb-xfixes'
    '--enable-libxml2'
    '--enable-libxvid'
    '--enable-libzimg'
    '--enable-libzmq'
    '--enable-libzvbi'
    '--enable-lv2'
    '--enable-lzma'
    '--enable-nonfree'
    '--enable-nvdec'
    '--enable-nvenc'
    '--enable-omx'
    '--enable-omx-rpi'
    '--enable-openal'
    '--enable-opencl'
    '--enable-opengl'
    '--enable-rkmpp'
    '--enable-sdl2'
    '--enable-sndio'
    '--enable-v4l2-m2m'
    '--enable-vaapi'
    '--enable-vapoursynth'
    '--enable-vdpau'
    '--enable-version3'
    '--enable-xlib'
    '--enable-zlib'
    )
  _mpv_options=(
    '--prefix=/usr'
    '--confdir=/etc/mpv'
    '--htmldir=/usr/share/doc/mpv/html'
    '--disable-test'
    '--disable-build-date'
    '--disable-vapoursynth-lazy'
    '--lua=luajit'
    '--enable-alsa'
    '--enable-audio-input'
    '--enable-caca'
    '--enable-cdda'
    '--enable-cplugins'
    '--enable-crossc'
    '--enable-cuda-hwaccel'
    '--enable-drm'
    '--enable-drmprime'
    '--enable-dvbin'
    '--enable-dvdnav'
    '--enable-dvdread'
    '--enable-egl-drm'
    '--enable-egl-x11'
    '--enable-gbm'
    '--enable-gl'
    '--enable-gl-wayland'
    '--enable-gl-x11'
    '--enable-html-build'
    '--enable-iconv'
    '--enable-jack'
    '--enable-javascript'
    '--enable-jpeg'
    '--enable-lcms2'
    '--enable-libarchive'
    '--enable-libass'
    '--enable-libass-osd'
    '--enable-libavdevice'
    '--enable-libbluray'
    '--enable-libmpv-shared'
    '--enable-libsmbclient'
    '--enable-libv4l2'
    '--enable-lua'
    '--enable-manpage-build'
    '--enable-openal'
    '--enable-plain-gl'
    '--enable-pulse'
    '--enable-rsound'
    '--enable-rubberband'
    '--enable-sdl2'
    '--enable-shaderc'
    '--enable-sndio'
    '--enable-tv'
    '--enable-tv'
    '--enable-tv-v4l2'
    '--enable-uchardet'
    '--enable-vaapi'
    '--enable-vaapi-drm'
    '--enable-vaapi-glx'
    '--enable-vaapi-wayland'
    '--enable-vaapi-x11'
    '--enable-vaapi-x-egl'
    '--enable-vdpau'
    '--enable-vdpau-gl-x11'
    '--enable-vulkan'
    '--enable-wayland'
    '--enable-wayland-protocols'
    '--enable-wayland-scanner'
    '--enable-x11'
    '--enable-xv'
    '--enable-zlib'
    '--enable-zsh-comp'
    )

    # '--enable-libdav1d'
    # '--enable-libsmbclient'
    # '--enable-avresample'

if [ -f /usr/lib/libvapoursynth.so ]; then
  _mpv_options+=('--enable-vapoursynth')
fi

  echo ${_ffmpeg_options[@]} > ffmpeg_options
  echo ${_mpv_options[@]} > mpv_options

  cd mpv

  ./bootstrap.py
}

build() {
  cd mpv-build
  ./build
}

package() {
  cd mpv-build
  DESTDIR="${pkgdir}" ./install

  install -Dm755 mpv/TOOLS/mpv_identify.sh "${pkgdir}/usr/bin/mpv-identify"
  install -Dm755 mpv/TOOLS/idet.sh "${pkgdir}/usr/bin/mpv-idet"
  install -Dm755 mpv/TOOLS/umpv "${pkgdir}/usr/bin/umpv"

  install -Dm644 mpv/DOCS/encoding.rst "${pkgdir}/usr/share/doc/mpv/encoding.rst"
  install -Dm644 mpv/DOCS/edl-mpv.rst "${pkgdir}/usr/share/doc/mpv/edl-mpv.rst"
  install -Dm644 mpv/DOCS/client-api-changes.rst "${pkgdir}/usr/share/doc/mpv/client-api-changes.rst"
  install -Dm644 mpv/DOCS/contribute.md "${pkgdir}/usr/share/doc/mpv/contribute.md"

  sed 's|/usr/local/etc/mpv.conf|/etc/mpv.conf|g' -i "${pkgdir}/usr/share/doc/mpv/mpv.conf"
  install -D -m644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/ffmpeg"

  (cd mpv/TOOLS/lua; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/mpv/scripts/${i}"; done)
}
