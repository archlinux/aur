# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname="gtk4-nocsd"
pkgname="${_pkgname}-git"
pkgver=r28.87d6130
pkgrel=1
pkgdesc="A small LD_PRELOAD library to disable CSD in GTK4 and LibAdwaita apps."
arch=("x86_64")
url="https://codeberg.org/MorsMortium/${_pkgname}"
license=("GPL-3.0-or-later")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("libadwaita")
makedepends=("git" "wayland" "wayland-protocols" "bash" "river")
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}/Source"
  ./Build.sh
}

package() {
  cd "${srcdir}/${pkgname}/Source"
  install -Dm 755 libgtk4-nocsd.so "${pkgdir}/usr/lib/libgtk4-nocsd.so"
}
