# Original Package: Jan de Groot <jgc@archlinux.org>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=gst-plugins-good-git
pkgver=1.16.0.r258.g0998c1643
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Good Plugins"
arch=('i686' 'x86_64')
license=('LGPL')
provides=('gst-plugins-good='$pkgver)
conflicts=('gst-plugins-good')
url="http://gstreamer.freedesktop.org/"
depends=('libpulse' 'jack2' 'libsoup' 
        'gst-plugins-base-git' 'wavpack' 'aalib' 
        'taglib' 'libdv' 'libshout' 'libvpx' 
        'gdk-pixbuf2' 'libcaca' 'libavc1394' 
        'libiec61883' 'libxdamage' 'v4l-utils' 
        'cairo' 'lame' 'mpg123' 
        'qt5-wayland' 'twolame'
      )
makedepends=('git' 'meson' 'gstreamer' 
             'speex' 'flac' 'libraw1394'
             'qt5-base' 'qt5-declarative')
options=()
source=('git+https://anongit.freedesktop.org/git/gstreamer/gst-plugins-good.git'
        'gst-common::git+https://gitlab.freedesktop.org/gstreamer/common.git')
sha256sums=('SKIP'
            'SKIP')

prepare(){
  cd gst-plugins-good

  git submodule init
  git config --local submodule.common.url "$srcdir/gst-common"
  git submodule update
}

pkgver() {
  cd gst-plugins-good
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gst-plugins-good build \
    -Ddoc=disabled
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
