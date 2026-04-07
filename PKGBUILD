# Maintainer: Ali Zain <alizain.x404@gmail.com>

pkgname=i3ipc-glib-git
_srcname=i3ipc-glib
pkgver=r174.1610403323.00790b4
pkgrel=1
pkgdesc="A C interface library to i3wm (Zainium Optimized)"
arch=('x86_64' 'aarch64')
url="https://github.com/acrisci/${_srcname}"
license=('GPL3')
depends=('glib2' 'json-glib' 'libxcb')
makedepends=('git' 'gobject-introspection' 'gtk-doc' 'glib2-devel' 'xcb-proto')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${_srcname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}"
  printf "r%s.%s.%s" "$(git rev-list --count HEAD)" "$(git log -1 --format=%ct)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_srcname}"
  
  # Using standard autogen if meson isn't forced, but ensuring glib-devel is utilized
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="${pkgdir}" install
}
