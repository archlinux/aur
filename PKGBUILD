# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=mpv-full-git
pkgver=0.40.0.r115.gf9ec3d2c25
pkgrel=1
pkgdesc='A free, open source, and cross-platform media player (git version with all possible libs)'
arch=('x86_64')
license=('GPL-2.0-or-later')
url='https://mpv.io/'
depends=(
    # official repositories:
    'alsa-lib'
    'ffmpeg-git'
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
    'sh'
    'sndio'
    'sdl2-compat'
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
provides=('mpv' 'mpv-git')
conflicts=('mpv')
options=('!emptydirs')
source=('git+https://github.com/mpv-player/mpv.git')
sha256sums=('SKIP')

pkgver() {
    local _version
    local _revision
    local _shorthash
    _version="$(git -C mpv tag | sort -Vr | head -n1 | sed 's/^v//')"
    _revision="$(git -C mpv rev-list v"${_version}"..HEAD --count)"
    _shorthash="$(git -C mpv rev-parse --short HEAD)"
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    arch-meson mpv build \
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
    install -D -m644 mpv/DOCS/{encoding.rst,tech-overview.txt} "${pkgdir}/usr/share/doc/mpv"
    install -D -m644 mpv/TOOLS/{umpv,mpv_identify.sh,stats-conv.py,idet.sh,lua/*} -t "${pkgdir}/usr/share/mpv/scripts"
    
    # delete private entries only required for static linking
    sed -i -e '/Requires.private/d' -e '/Libs.private/d' "${pkgdir}/usr/lib/pkgconfig/mpv.pc"
}
