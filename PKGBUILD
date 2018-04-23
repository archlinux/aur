# Maintainer: XZS <d dot f dot fischer at web dot de>
pkgname=vala-dbus-binding-tool-git
pkgver=1.0.r119
pkgrel=1
pkgdesc="Creates gobject interfaces out of DBus XML specifications."
arch=('i686' 'x86_64')
url="https://github.com/freesmartphone/vala-dbus-binding-tool"
license=('GPLv3')
depends=('vala' 'dbus')
makedepends=('vala>=0.30.0')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  grep -Po '(?<=vala_dbus_binding_tool_base_version\]. \[)[[:digit:].]+(?=\])' configure.ac | tr '\n' '.'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}
