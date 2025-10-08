# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=mpv-full
pkgver=0.40.0
pkgrel=2
pkgdesc='A free, open source, and cross-platform media player (with all possible libs)'
arch=('x86_64')
license=('GPL-2.0-or-later')
url='https://mpv.io/'
depends=(
    'alsa-lib'
    'ffmpeg'
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'jack'
    'lcms2'
    'libarchive'
    'libass'
    'libbluray'
    'libcaca'
    'libcdio'
    'libcdio-paranoia'
    'libdisplay-info'
    'libdrm'
    'libdvdnav'
    'libgl'
    'libjpeg'
    'libpipewire'
    'libplacebo'
    'libpulse'
    'libsixel'
    'libva'
    'libvdpau'
    'libx11'
    'libxext'
    'libxkbcommon'
    'libxpresent'
    'libxrandr'
    'libxss'
    'libxv'
    'lua52'
    'mesa'
    'mujs'
    'openal'
    'rubberband'
    'sdl2-compat'
    'sh'
    'sndio'
    'uchardet'
    'vapoursynth'
    'vulkan-icd-loader'
    'wayland'
    'zimg'
    'zlib')
makedepends=(
    'ffnvcodec-headers'
    'git'
    'ladspa'
    'meson'
    'python-docutils'
    'vulkan-headers'
    'wayland-protocols'
    # for satisfying pkgcheck:
    'python-pyqt6'
    'python-pyqtgraph')
optdepends=(
    'nvidia-utils: for hardware accelerated video decoding with CUDA'
    'python: for stats-conv and umpv scripts'
    'python-pyqt6: for stats-conv script'
    'python-pyqtgraph: for stats-conv script'
    'youtube-dl: for video-sharing websites playback'
    'yt-dlp: for video-sharing websites playback')
provides=('mpv')
conflicts=('mpv')
options=('!emptydirs')
source=("https://github.com/mpv-player/mpv/archive/v${pkgver}/mpv-${pkgver}.tar.gz"
        '010-mpv-ffmpeg8.0-support.patch'::'https://github.com/mpv-player/mpv/commit/26b29fba02a2782f68e2906f837d21201fc6f1b9.patch')
sha256sums=('10a0f4654f62140a6dd4d380dcf0bbdbdcf6e697556863dc499c296182f081a3'
            '9596f2390a120a54d1bc48a3937d6f236feab0c4cecaae8a0d3dec59a38e29b3')

prepare() {
    patch -d "mpv-${pkgver}" -Np1 -i "${srcdir}/010-mpv-ffmpeg8.0-support.patch"
}

build() {
    arch-meson "mpv-${pkgver}" build \
        -Dgpl='true' \
        -Dcplayer='true' \
        -Dlibmpv='true' \
        -Dbuild-date='false' \
        -Dtests='true' \
        -Dfuzzers='false' \
        \
        -Dcdda='enabled' \
        -Dcplugins='enabled' \
        -Ddvbin='enabled' \
        -Ddvdnav='enabled' \
        -Diconv='enabled' \
        -Djavascript='enabled' \
        -Dlcms2='enabled' \
        -Dlibarchive='enabled' \
        -Dlibavdevice='enabled' \
        -Dlibbluray='enabled' \
        -Dlua='auto' \
        \
        -Dpthread-debug='disabled' \
        -Drubberband='enabled' \
        -Dsdl2='enabled' \
        -Dsdl2-gamepad='enabled' \
        -Duchardet='enabled' \
        -Duwp='disabled' \
        -Dvapoursynth='enabled' \
        -Dvector='enabled' \
        -Dwin32-threads='disabled' \
        -Dzimg='enabled' \
        -Dzlib='enabled' \
        \
        -Dalsa='enabled' \
        -Daudiounit='disabled' \
        -Dcoreaudio='disabled' \
        -Davfoundation='disabled' \
        -Djack='enabled' \
        -Dopenal='enabled' \
        -Dopensles='disabled' \
        -Doss-audio='disabled' \
        -Dpipewire='enabled' \
        -Dpulse='enabled' \
        -Dsdl2-audio='enabled' \
        -Dsndio='enabled' \
        -Dwasapi='disabled' \
        \
        -Dcaca='enabled' \
        -Dcocoa='disabled' \
        -Dd3d11='disabled' \
        -Ddirect3d='disabled' \
        -Ddmabuf-wayland='enabled' \
        -Ddrm='enabled' \
        -Degl='enabled' \
        -Degl-android='disabled' \
        -Degl-angle='disabled' \
        -Degl-angle-lib='disabled' \
        -Degl-angle-win32='disabled' \
        -Degl-drm='enabled' \
        -Degl-wayland='enabled' \
        -Degl-x11='enabled' \
        -Dgbm='enabled' \
        -Dgl='enabled' \
        -Dgl-cocoa='disabled' \
        -Dgl-dxinterop='disabled' \
        -Dgl-win32='disabled' \
        -Dgl-x11='enabled' \
        -Djpeg='enabled' \
        -Dsdl2-video='enabled' \
        -Dshaderc='disabled' \
        -Dsixel='enabled' \
        -Dspirv-cross='disabled' \
        -Dplain-gl='enabled' \
        -Dvdpau='enabled' \
        -Dvdpau-gl-x11='enabled' \
        -Dvaapi='enabled' \
        -Dvaapi-drm='enabled' \
        -Dvaapi-wayland='enabled' \
        -Dvaapi-win32='disabled' \
        -Dvaapi-x11='enabled' \
        -Dvulkan='enabled' \
        -Dwayland='enabled' \
        -Dx11='enabled' \
        -Dxv='enabled' \
        \
        -Dandroid-media-ndk='disabled' \
        -Dcuda-hwaccel='enabled' \
        -Dcuda-interop='enabled' \
        -Dd3d-hwaccel='disabled' \
        -Dd3d9-hwaccel='disabled' \
        -Dgl-dxinterop-d3d9='disabled' \
        -Dios-gl='disabled' \
        -Dvideotoolbox-gl='disabled' \
        -Dvideotoolbox-pl='disabled' \
        \
        -Dmacos-10-15-4-features='disabled' \
        -Dmacos-11-features='disabled' \
        -Dmacos-11-3-features='disabled' \
        -Dmacos-12-features='disabled' \
        -Dmacos-cocoa-cb='disabled' \
        -Dmacos-media-player='disabled' \
        -Dmacos-touchbar='disabled' \
        -Dswift-build='disabled' \
        -Dswift-flags='disabled' \
        \
        -Dhtml-build='disabled' \
        -Dmanpage-build='enabled' \
        -Dpdf-build='disabled'
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 "mpv-${pkgver}/DOCS"/{encoding.rst,tech-overview.txt} "${pkgdir}/usr/share/doc/mpv"
    install -D -m644 "mpv-${pkgver}/TOOLS"/{umpv,mpv_identify.sh,stats-conv.py,idet.sh,lua/*} -t "${pkgdir}/usr/share/mpv/scripts"
    
    # delete private entries only required for static linking
    sed -i -e '/Requires.private/d' -e '/Libs.private/d' "${pkgdir}/usr/lib/pkgconfig/mpv.pc"
}
