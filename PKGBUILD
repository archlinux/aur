# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
_pkgname=confy
pkgname=confy-git
pkgver=0.8.0.r0.g2b9601c
pkgrel=1
pkgdesc="Conferences schedule viewer for GNOME"
arch=('x86_64' 'aarch64')
url="https://confy.kirgroup.net/"
license=(GPL3)
depends=('python' 'gtk4' 'libadwaita' 'python-gobject' 'python-icalendar' 'libnotify')
makedepends=('meson' 'ninja' 'blueprint-compiler' 'gobject-introspection' 'git')
provides=(confy)
conflicts=(confy)
source=("git+https://git.sr.ht/~fabrixxm/confy")
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson --reconfigure build "$_pkgname"
    ninja -C build
}

check() {
  cd "${srcdir}/build"
  ninja test
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
