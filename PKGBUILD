# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Original Package: Kerrick Staley <mail@kerrickstaley.com>

pkgname=gst-python2-git
pkgver=1.3.0.1.1272.59784c2
pkgrel=1
pkgdesc='GStreamer Python 2 overrides for the gobject-introspection-based pygst bindings (Git version)'
arch=('i686' 'x86_64' 'armv6h')
license=('LGPL')
depends=('gstreamer' 'python2' 'gobject-introspection')
url='http://gstreamer.freedesktop.org/modules/gst-python.html'

provides=(gst-python2)
conflicts=(gst-python2)

source=('git://anongit.freedesktop.org/gstreamer/gst-python')
md5sums=('SKIP')

gitname='gst-python' 

pkgver() {
  cd $gitname
  version=$(grep AC_INIT configure.ac | sed 's/AC_INIT(GStreamer GObject Introspection overrides for Python , //' | sed 's/,//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash
}

build() {
    cd $gitname
    ./autogen.sh --prefix=/usr PYTHON=/usr/bin/python2
    make
}

package() {
    cd $gitname
    make DESTDIR="$pkgdir" install
}

