# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname="gtk4-nocsd"
pkgname="${_pkgname}-git"
pkgver=r3.3e1c671
pkgrel=1
pkgdesc="A small LD_PRELOAD library to disable CSD in GTK4 and LibAdwaita apps."
arch=("x86_64")
url="https://codeberg.org/MorsMortium/${_pkgname}"
license=("GPL-3.0-or-later")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("libadwaita")
makedepends=("git")
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  gcc -fPIC -shared -o libgtk4-nocsd.so GTK4-NoCSD.c $(pkg-config --cflags --libs libadwaita-1)
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 755 libgtk4-nocsd.so "${pkgdir}/usr/lib/libgtk4-nocsd.so"
}
