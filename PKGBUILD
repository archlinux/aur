# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>

pkgname=libnotify-git
_pkgname=libnotify
pkgver=0.7.12.r0.8162b1d
pkgrel=1
pkgdesc="Library for sending desktop notifications"
arch=('i686' 'x86_64')
license=('GPL')
url='https://gitlab.gnome.org/GNOME/libnotify'
depends=()
makedepends=('pkgconfig' 'meson' 'xmlto' 'git' 'gobject-introspection' 'gtk-doc' 'gnome-common-git')
options=('!libtool')
conflicts=("${_pkgname}")
provides=("${_pkgname}=0.7.12")
source=("${_pkgname}::git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${_pkgname}"

  meson -Dprefix=/usr build
}

build() {
  cd "${_pkgname}"

  meson compile -C build
}

package() {
  cd "${_pkgname}"

  echo ${pkgdir}

  DESTDIR=${pkgdir} meson install -C build
}
