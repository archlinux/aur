# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=("libastal-gjs-git")
pkgver=r580.d538d8e
pkgrel=1
pkgdesc="gjs bindings for libstal."
arch=("x86_64")
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
makedepends=(
  "git"
  "meson")
depends=("gjs" "libastal-git" "libastal-io-git")
groups=("libastal")
provides=(libastal-gjs)
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver(){
  cd astal
  # git describe --long --tags --abbrev=7 | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd astal/lang/gjs
  arch-meson build
  meson compile -C build
}

package() {
  cd astal/lang/gjs
  meson install -C build --destdir "$pkgdir"
}
