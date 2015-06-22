# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=gst-editing-services-git
pkgver=1.3.0.1.1893.be23365
pkgrel=1
pkgdesc='GStreamer editing services (Git version)'
arch=('i686' 'x86_64')
license=('LGPL')
url='http://gstreamer.freedesktop.org/modules/gst-editing-services.html'
depends=('gst-plugins-base-git')
conflicts=('gst-editing-services')
makedepends=('git' 'intltool' 'pkgconfig' 'gtk-doc')
provides=('gst-editing-services='$pkgver)
options=('!libtool')
groups=('gstreamer')

source=('git://anongit.freedesktop.org/gstreamer/gst-editing-services')

sha256sums=('SKIP')
_gitname='gst-editing-services'

pkgver() {
  cd $_gitname
  
  version=$(grep AC_INIT configure.ac | sed 's/AC_INIT(GStreamer Editing Services, //' | sed 's/,//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash  
}

build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}
