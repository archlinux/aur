# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname="gtk-nocsd"
pkgname="${_pkgname}-git"
pkgver=r118.c870241
pkgrel=1
pkgdesc="An LD_PRELOAD library to disable CSD in GTK3/4, LibHandy, and LibAdwaita apps."
arch=("x86_64")
url="https://codeberg.org/MorsMortium/${_pkgname}"
license=("GPL-3.0-or-later")
provides=("${_pkgname}" "gtk3-nocsd" "gtk3-nocsd-git" "gtk4-nocsd" "gtk4-nocsd-git")
conflicts=("${_pkgname}" "gtk3-nocsd" "gtk3-nocsd-git" "gtk4-nocsd" "gtk4-nocsd-git")
replaces=("gtk3-nocsd" "gtk3-nocsd-git" "gtk4-nocsd" "gtk4-nocsd-git")
makedepends=("git" "libadwaita")
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install DESTDIR="${pkgdir}" PREFIX="/usr" LIBDIR="/usr/lib"
}
