# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=mpv-full
pkgver=0.41.0
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
    'libjpeg-turbo'
    'libpipewire'
    'libplacebo'
    'libpulse'
    'libsixel'
    'libva'
    'libvdpau'
    'libx11'
    'libxext'
    'libxfixes'
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
    'sdl2'
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
        '010-mpv-vapoursynth-fix-001.patch'::'https://github.com/mpv-player/mpv/commit/75b2ccfeb1ce4ed5a40ac9860fa74f3d1265e13f.patch'
        '020-mpv-vapoursynth-fix-002.patch'::'https://github.com/mpv-player/mpv/commit/fb6c700ecbc695ba355d998340a6e6ef9e625b70.patch')
sha256sums=('ee21092a5ee427353392360929dc64645c54479aefdb5babc5cfbb5fad626209'
            'fe357801d733565b4bda28c388b300d632f34b9d9c4b7b554437e6f0dbb034f4'
            'cd97e8445e81ec90843d2b994f7d46eb675b2b05c09e5ec0be7895c4d78f5720')

prepare() {
    patch -d "mpv-${pkgver}" -Np1 -i "${srcdir}/010-mpv-vapoursynth-fix-001.patch"
    patch -d "mpv-${pkgver}" -Np1 -i "${srcdir}/020-mpv-vapoursynth-fix-002.patch"
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
        -Dsdl2-gamepad='enabled' \
        -Duchardet='enabled' \
        -Duwp='disabled' \
        -Dvapoursynth='enabled' \
        -Dvector='enabled' \
        -Dwin32-threads='disabled' \
        -Dx11-clipboard='enabled' \
        -Dzimg='enabled' \
        -Dzlib='enabled' \
        \
        -Dalsa='enabled' \
        -Daudiounit='disabled' \
        -Dcoreaudio='disabled' \
        -Davfoundation='disabled' \
        -Djack='enabled' \
        -Dopenal='enabled' \
        -Daudiotrack='disabled' \
        -Daaudio='disabled' \
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
