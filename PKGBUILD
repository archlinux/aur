
_name=gst-debugger
pkgname=$_name-git
pkgver=0.90.0.18.g5659345
pkgrel=1
pkgdesc="Remote GStreamer Debugger"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/GstDebugger"
license=('GPL')
depends=('graphviz' 'protobuf-c' 'gstreamermm' 'gtkmm3' 'boost-libs' 'gstreamer>1.7.0')
makedepends=('gnome-common' 'intltool' 'git' 'boost')
options=(!libtool)
provides=($_name)
conflicts=($_name)
source=(git://git.gnome.org/$_name)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --tags | sed 's/_/./g;s/-/./g'
}

build() {
  cd "$srcdir/$_name"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir/" install
}
