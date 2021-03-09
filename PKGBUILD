# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

gitname=contractor
pkgname=contractor-git
pkgver=0.3.4.r230.73372b4
pkgrel=1
pkgdesc=' A desktop-wide extension service'
arch=(x86_64)
url="https://github.com/elementary/${gitname}"
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
provides=(${gitname} ${pkgname})
conflicts=(${gitname})
source=("git+${url}.git")
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
