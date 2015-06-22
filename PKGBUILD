# $Id: PKGBUILD 180531 2013-03-22 19:24:55Z heftig $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gst-plugins-ugly-git
pkgver=1.3.1.1.5085.a665347
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Ugly Plugins"
arch=('i686' 'x86_64')
license=('LGPL')
provides=('gst-plugins-ugly='$pkgver)
conflicts=('gst-plugins-ugly')
url="http://gstreamer.freedesktop.org/"
depends=('gst-plugins-base-libs' 'libdvdread' 'lame' 'libmpeg2' 'a52dec' 'libmad' 'libsidplay' 'libcdio' 'x264' 'opencore-amr')
options=(!libtool !emptydirs)

source='git://anongit.freedesktop.org/gstreamer/gst-plugins-ugly'
sha256sums=('SKIP')

_gitname='gst-plugins-ugly'

pkgver() {
  cd $_gitname
  version=$(grep AC_INIT configure.ac | sed 's/AC_INIT(\[GStreamer Ugly Plug-ins\],\[//' | sed 's/\],\[http:\/\/bugzilla.gnome.org\/enter_bug.cgi?product=GStreamer\],\[gst-plugins-ugly\])//')
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
