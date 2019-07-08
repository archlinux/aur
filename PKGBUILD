# Original Package: Jan de Groot <jgc@archlinux.org>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname='gst-plugins-base-git'
pkgver=1.17.0.1.19939.2e686b0da
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Base Plugins"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('pkgconfig'  'git' 'gstreamer-git' 
             'orc' 'libxv' 'alsa-lib' 'cdparanoia' 
             'libvisual' 'libvorbis' 'libtheora' 'glu' 
             'pango' 'gobject-introspection')
options=(!libtool !emptydirs)
url="http://gstreamer.freedesktop.org/"

conflicts=('gst-plugins-base' 'gst-plugins-base-libs')
provides=('gst-plugins-base='$pkgver 'gst-plugins-base-libs='$pkgver)

pkgdesc="GStreamer Multimedia Framework Base Plugins"
depends=('gstreamer-git' 'orc' 'libxv' 'opus' 
        'alsa-lib' 'cdparanoia' 'libjpeg-turbo' 
        'libvisual' 'libvorbis' 'libtheora' 'pango')

source=('git://anongit.freedesktop.org/gstreamer/gst-plugins-base')
sha256sums=('SKIP')

_gitname='gst-plugins-base'

pkgver() {
  cd $_gitname
  version=$(grep AC_INIT configure.ac | sed 's/AC_INIT(\[GStreamer Base Plug-ins\],\[//' | sed 's/\],\[http:\/\/bugzilla.gnome.org\/enter_bug.cgi?product=GStreamer\],\[gst-plugins-base\])//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)

  echo $version.$revision.$hash
}

build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
  --disable-static --enable-experimental
  make 
}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
}

