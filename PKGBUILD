# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
_pkgname=confy
pkgname=confy-git
pkgver=0.6.3.r1.g3ecc143
pkgrel=1
pkgdesc="Conferences schedule viewer for GNOME"
arch=('x86_64' 'aarch64')
url="https://confy.kirgroup.net/"
license=(GPL3)
depends=('python' 'gtk3' 'libhandy' 'python-gobject' 'python-icalendar' 'libnotify')
makedepends=('meson' 'ninja' 'gobject-introspection' 'git')
provides=(confy)
conflicts=(confy)
source=("git+https://git.sr.ht/~fabrixxm/confy")
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
