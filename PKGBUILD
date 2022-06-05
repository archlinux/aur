# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
_pkgname=appaya
pkgname=appaya-git
pkgver=0.2.0.r3.g83e3108
pkgrel=1
pkgdesc="Gnome app to monitor and control Syncthing daemon"
arch=('x86_64' 'aarch64')
url="https://git.sr.ht/~fabrixxm/appaya"
license=(GPL3)
depends=('gtk4' 'libadwaita' 'zint')
makedepends=('meson' 'ninja' 'gobject-introspection' 'git' 'vala' 'blueprint-compiler')
provides=(appaya)
conflicts=(appaya)
source=("git+https://git.sr.ht/~fabrixxm/appaya")
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson build "$_pkgname"
    ninja -C build
}

check() {
  cd "${srcdir}/build"
  ninja test
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
