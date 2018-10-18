# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=akira-git
pkgver=r166.144fd19
pkgrel=1
pkgdesc="Native Linux App for UI and UX Design built in Vala and Gtk"
arch=(x86_64)
url="https://github.com/Alecaddd/Akira"
license=(GPL3)
depends=(granite)
makedepends=(granite
             gtksourceview3
             meson
             vala)
checkdepends=(vala-lint-git)
provides=(akira)
source=("git+https://github.com/Alecaddd/Akira.git")
sha256sums=(SKIP)

pkgver() {
  cd Akira
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir build
}

build() {
  cd build
  meson --prefix=/usr --buildtype=release ../Akira
  ninja
}

check() {
  cd build
  ninja test
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
