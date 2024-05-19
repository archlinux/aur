# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-auth-git
_pkgname=libastal-auth
pkgver=r6.df48cbd
pkgrel=1
provides=(libastal-auth libastal-auth.so=0-64)
pkgdesc="Authentication library intended for use with the libastal suite."
arch=(x86_64)
license=(GPL-3)
url="https://github.com/astal-sh/libastal-auth"
depends=(
  glib2
  pam
)
makedepends=(
  meson
  git
  gobject-introspection
  vala
)
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  #git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $_pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd $_pkgname
  meson install -C build --destdir "$pkgdir"
}

