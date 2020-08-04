pkgname=libepoxy-git
_name=libepoxy
pkgver=1.5.4.r20.g34ecb90
pkgrel=1
pkgdesc="Epoxy is a library for handling OpenGL function pointer management for you"
url="https://github.com/anholt/libepoxy"
arch=('i686' 'x86_64')
license=('BSD')
makedepends=("xorg-util-macros" "libx11" "python" "git" "meson")
provides=("libepoxy")
conflicts=("libepoxy")
source=("git+https://github.com/anholt/libepoxy.git")
md5sums=('SKIP')

pkgver() {
  cd $_name

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"

  rm -rf _build
  meson _build --buildtype=release --prefix=/usr --libdir=/usr/lib
  ninja -C _build
}

#check() {
#  cd "$_name/_build"
#
#  ninja test
#}

package() {
  cd "$_name/_build"
  env DESTDIR="$pkgdir" ninja install
}
