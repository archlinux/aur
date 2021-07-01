# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer-git
pkgver=1.19.1.r11.gba294415d
pkgrel=1
pkgdesc='GStreamer Multimedia Framework (Git version)'
arch=('i686' 'x86_64')
license=('LGPL')
url='http://gstreamer.freedesktop.org/'
depends=('libxml2' 'glib2' 'libcap'
          'libunwind' 'libelf'
          'bash-completion' 'python')
optdepends=('sh: feedback script')
makedepends=('intltool' 'pkgconfig' 'gtk-doc'
             'meson' 'gtk3'
             'gobject-introspection' 'git')
provides=('gstreamer='$pkgver)
conflicts=('gstreamer')
options=('!libtool')

_gitname='gstreamer'

source=('git+git://anongit.freedesktop.org/gstreamer/gstreamer')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gstreamer build \
    -Ddbghelp=disabled -Ddoc=disabled
  ninja -C build
}

#check() {
#  cd $_gitname
#  make check
#}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
