# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Original Package: Kerrick Staley <mail@kerrickstaley.com>

pkgname=gst-python-git
pkgver=1.3.0.1.1277.16979ed
pkgrel=1
pkgdesc='GStreamer GObject Introspection overrides for Python 3'
arch=('i686' 'x86_64' 'armv6h')
license=('LGPL')
depends=('gstreamer' 'python' 'gobject-introspection')
url='http://gstreamer.freedesktop.org/modules/gst-python.html'

provides=(gst-python)
conflicts=(gst-python)

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
    ./autogen.sh --prefix=/usr PYTHON=/usr/bin/python3
    make
}

package() {
    cd $gitname
    make DESTDIR="$pkgdir" install
}

