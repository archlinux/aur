# Maintainer: xpt <user.xpt@gmail.com>
pkgname=nasc-git
_pkgname=nasc
pkgver=0.7.5.r13.ga95d1f8
pkgrel=2
pkgdesc='Do maths like a normal person.'
arch=('i686' 'x86_64')
url='http://parnold-x.github.io/nasc/'
license=('GPL3')
depends=('gtk3' 'libqalculate' 'granite' 'glib2' 'libgee' 'gtksourceview3' 'libsoup' 'cln' )
optdepends=()
makedepends=('vala' 'git' 'meson')
provides=("nasc")
conflicts=("nasc" "nasc-bzr")
install="${pkgname%-*}.install"
source=('git+https://github.com/parnold-x/nasc')
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
  cd ${_pkgname}
  meson build --prefix=/usr
  ninja -v -C build
}

package() {
  cd ${_pkgname}
  DESTDIR="$pkgdir" ninja -v -C build install
}


