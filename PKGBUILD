# Original Package: Jan de Groot <jgc@archlinux.org>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=gst-plugins-bad-git
pkgver=1.5.1.1.19128.1248b00
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Bad Plugins"
arch=('i686' 'x86_64')
license=('LGPL')
provides=('gst-plugins-bad='$pkgver)
conflicts=('gst-plugins-bad' 'gst-plugins-gl')
url="http://gstreamer.freedesktop.org/"
depends=('mjpegtools' 'gst-plugins-base-git' 'curl' 'chromaprint' 'libmms' 'faad2' 'mpg123' 'faac' 'celt' 'libdca' 'soundtouch' 'spandsp' 'libdvdnav' 'libmodplug' 'libgme' 'opus' 'wayland' 'rtmpdump')
makedepends=('schroedinger' 'libexif' 'libdvdread' 'libvdpau' 'libmpeg2' 'gtk-doc' 'glu')
options=(!libtool !emptydirs)

source='git+git://anongit.freedesktop.org/gstreamer/gst-plugins-bad'
sha256sums=('SKIP')

_gitname='gst-plugins-bad'

pkgver() {
  cd $_gitname
  version=$(grep AC_INIT configure.ac | sed 's/AC_INIT(\[GStreamer Bad Plug-ins\],\[//' | sed 's/\],\[http:\/\/bugzilla.gnome.org\/enter_bug.cgi?product=GStreamer\],\[gst-plugins-bad\])//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash
}

build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental --disable-fatal-warnings \
    --with-gtk=3.0 --disable-gtk-doc
  make
}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
}
