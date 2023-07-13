# Maintainer:  <zhaose233@outlook.com>
pkgname=mission-center-git
_pkgname=mission-center
pkgver=r206.2d21e28
pkgrel=1
pkgdesc="Monitor your CPU, Memory, Disk, Network and GPU usage"
arch=('i686' 'x86_64' 'aarch64')
url=""
license=('GPL')
groups=()
depends=('gtk4'
	 'libadwaita'
	 'sqlite'
	 'gobject-introspection')
makedepends=('meson'
	     'rust'
	     'git'
	     'python-gobject')
checkdepends=()

optdepends=()
provides=("mission-center")
conflicts=("mission-center")

source=("git+https://gitlab.com/mission-center-devs/mission-center.git")

md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"

  meson setup --prefix=/usr build
}

build() {
  cd "$srcdir/$_pkgname"

  meson compile -C build
}

package() {
  cd "$srcdir/$_pkgname"

  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:
