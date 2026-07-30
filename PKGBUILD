# Maintainer: Selim Bucher <me@selim.one>

pkgname=libastal-quarrel-git
_pkgname=quarrel
pkgver=r912.9dac92f
pkgrel=1
provides=(libastal-quarrel)
pkgdesc="CLI argument parsing library for Astal (Quarrel)"
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
depends=(
  glib2
  glibc
)
makedepends=(
  meson
  git
  gobject-introspection
  vala
)
groups=("libastal")
# pinned: astal has no tagged releases, so build a known-good master commit
_commit=9dac92f20e6c89b9373bbb238c49b1cb115724db
source=("git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd astal
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd astal/lib/$_pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd astal/lib/$_pkgname
  meson install -C build --destdir "$pkgdir"
}
