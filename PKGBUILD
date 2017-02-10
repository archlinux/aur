# Maintainer Yurii Kolesnykov <yurikoles@gmail.com>
# Credit: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10-ffmpeg
_pkgname=gst-ffmpeg
pkgver=0.10.13
pkgrel=8
pkgdesc="Gstreamer FFMpeg Plugin"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('gstreamer0.10-base' 'bzip2')
makedepends=('pkgconfig' 'yasm' 'sdl' 'git' 'gtk-doc')
url="http://gstreamer.freedesktop.org/"
groups=('gstreamer0.10-plugins')
source=("git+https://gitlab.com/gstreamer-sdk/$_pkgname.git#commit=94e587b9182c6d2fde9a61c9def790c8047453c0")
sha256sums=('SKIP')

build() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static --enable-gtk-doc --with-ffmpeg-extra-configure="--enable-runtime-cpudetect"
  make
}

check() {
  cd $_pkgname
  make check
}

package() {
  cd $_pkgname
  make DESTDIR="${pkgdir}" install
}
