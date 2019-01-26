# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=contractor-git
pkgver=0.3.4.r3.79d8168
pkgrel=1
pkgdesc=' A desktop-wide extension service'
arch=(x86_64)
url=https://github.com/elementary/contractor
license=(GPL3)
groups=(pantheon-unstable)
depends=(
  glib2
  libgee
)
makedepends=(
  git
  meson
  vala
)
provides=(contractor)
conflicts=(contractor)
source=(git+https://github.com/elementary/contractor.git)
sha256sums=(SKIP)

pkgver() {
  cd contractor

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  arch-meson contractor build \
    -D b_pie=false
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et:
