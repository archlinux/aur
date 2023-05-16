# Maintainer:
# Contributor: Benjamin Landis <bmlandis2010@gmail.com>

_pkgname="mpv-vapoursynth"
pkgname="$_pkgname-git"
pkgver=0.35.0.r386.gacababec20
pkgrel=1
pkgdesc='A free, open source, and cross-platform media player (with Vapoursynth enabled)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url='https://mpv.io/'
depends=(
  'alsa-lib'
  'desktop-file-utils'
  'ffmpeg'
  'glibc'
  'hicolor-icon-theme'
  'jack'
  'lcms2'
  'libarchive'
  'libarchive.so'
  'libasound.so'
  'libass'
  'libass.so'
  'libavcodec.so'
  'libavdevice.so'
  'libavfilter.so'
  'libavformat.so'
  'libavutil.so'
  'libbluray'
  'libbluray.so'
  'libcaca'
  'libcdio'
  'libcdio-paranoia'
  'libdrm'
  'libdvdnav'
  'libdvdread'
  'libegl'
  'libgl'
  'libglvnd'
  'libjack.so'
  'libjpeg'
  'libjpeg.so'
  'liblcms2.so'
  'libplacebo'
  'libplacebo.so'
  'libpulse'
  'libpulse.so'
  'librubberband.so'
  'libshaderc_shared.so'
  'libswresample.so'
  'libswscale.so'
  'libva'
  'libva-drm.so'
  'libva-wayland.so'
  'libva-x11.so'
  'libva.so'
  'libvdpau'
  'libx11'
  'libxext'
  'libxinerama'
  'libxkbcommon'
  'libxkbcommon.so'
  'libxrandr'
  'libxss'
  'libxv'
  'lua52'
  'mesa'
  'mujs'
  'rubberband'
  'shaderc'
  'uchardet'
  'vapoursynth'
  'vulkan-icd-loader'
  'wayland'
  'xdg-utils'
  'zlib'
)
makedepends=(
  'ffnvcodec-headers'
  'git'
  'ladspa'
  'python-docutils'
  'vulkan-headers'
  'waf'
  'wayland-protocols'
)
provides=('mpv')
conflicts=('mpv')
options=('!emptydirs')
validpgpkeys=('145077D82501AA20152CACCE8D769208D5E31419') # sfan5 <sfan5@live.de>
source=(
  "$_pkgname"::"git+https://github.com/mpv-player/mpv"
)
sha256sums=(
  'SKIP'
)


pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --enable-cdda \
    --enable-dvb \
    --enable-dvdnav \
    --enable-libarchive \
    --enable-libmpv-shared \
    --disable-build-date \
    --enable-vapoursynth

  waf build
}

package() {
  cd "$srcdir/$_pkgname"

  waf install --destdir="$pkgdir"

  install -m0644 DOCS/{encoding.rst,tech-overview.txt} \
    "$pkgdir"/usr/share/doc/mpv

  install -m0644 TOOLS/lua/* \
    -D -t "$pkgdir"/usr/share/mpv/scripts
}
