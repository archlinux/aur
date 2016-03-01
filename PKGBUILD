# Maintainer: Arne Hoch <arne at derhoch dot de>

pkgname=gst-rpicamsrc-git
_gitname=gst-rpicamsrc
pkgver=r76.fe12cf1
pkgrel=1
pkgdesc="GStreamer element to access the RaspberryPI Camera."
arch=('armv6h' 'armv7h')
url="https://github.com/thaytan/gst-rpicamsrc"
license=('LGPL')
depends=('gst-plugins-base' 'raspberrypi-firmware-tools')
#makedepends=('pkg-config')
options=(!libtool)
source=('git+https://github.com/thaytan/gst-rpicamsrc.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
}
