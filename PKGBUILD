# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
 
_realname='gst-plugins-vr'
pkgname="$_realname-git"
pkgver=0.1.0.124.6107212
pkgrel=1
pkgdesc='Virtual Reality plugins for GStreamer '
arch=('i686' 'x86_64')
url='https://github.com/lubosz/gst-plugins-vr'
depends=('glib2' 'gst-plugins-bad')
provides=("$_realname="$pkgver)
conflicts=("$_realname")
license=('LGPLv2')
 
source=('git+https://github.com/lubosz/gst-plugins-vr.git')
md5sums=('SKIP')

subver() {
  PREFIX="gst_$1 = "
  echo $(grep "$PREFIX" meson.build | eval sed "'s/$PREFIX//'")
}
 
pkgver() {
  cd $_realname
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $(subver major).$(subver minor).$(subver micro).$revision.$hash
}
 
build() {
  cd $_realname
  ./configure --prefix=/usr
  make
}
 
package() {
  cd $_realname
  make DESTDIR="$pkgdir" install
  mv $pkgdir/usr/lib64 $pkgdir/usr/lib
}
