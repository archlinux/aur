# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=gst-transcoder-git
pkgver=0.19.1ac6db5
pkgrel=1
pkgdesc="GStreamer Transcoding API"
arch=('i686' 'x86_64')
license=('LGPL')
provides=('gst-transcoder='$pkgver)
conflicts=('gst-transcoder')
url="http://gstreamer.freedesktop.org/"
depends=('gstreamer>=1.7')
makedepends=('git' 'meson')
options=(!libtool !emptydirs)

source=('git+https://github.com/pitivi/gst-transcoder.git')
sha256sums=('SKIP')

_gitname='gst-transcoder'

pkgver() {
  cd $_gitname
  #version=$(grep AC_INIT validate/configure.ac | sed 's/AC_INIT(Gst-Validate, //' | sed 's/,//')
  version="0"
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash
}

build() {
  cd $_gitname
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
  mv ${pkgdir}/usr/lib64/ ${pkgdir}/usr/lib
}
