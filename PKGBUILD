# Maintainer: Swift Geek
#TODO: sed for changing % of free ram to trigger
#TODO: sed for changing oom-killer method
#TODO: sed for fixing *.service executable path (syslog might be also bad)
#TODO: approperiate install messages

pkgname=kmscube-git
_pkgname=${pkgname%-*}
pkgver=a
pkgrel=2
pkgdesc="example gl app using kms/gbm"
arch=('i686' 'x86_64')
url="https://cgit.freedesktop.org/mesa/kmscube/"
license=('custom')
depends=('mesa' 'libpng' 'gst-plugins-base-libs')
makedepends=('git')
source=("git://anongit.freedesktop.org/mesa/kmscube")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}/"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "$srcdir/${_pkgname}/"
  DESTDIR="${pkgdir}" ninja -C build install
}
