# Maintainer: Tomasz Oponowicz <tomasz at zaxo dot biz>

# Regenerate the `.SRCINFO` file:
# $ makepkg --printsrcinfo > .SRCINFO

pkgname=markets
pkgver=0.1.0
pkgrel=1
pkgdesc="A market tracker designed for Linux Smartphones"
url="https://github.com/bitstower/markets"
arch=(x86_64)
license=(GPL3)
depends=(
    libgee
    libsoup
    libhandy
    json-glib
    glib2
    gtk3
)
makedepends=(
    git
    meson
    vala
)
_commit=c5526b175c041082545ec9963bc0c91e1a3cf3d7  # 0.1.0
source=("git+https://github.com/bitstower/markets.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

# check() {
#   meson test -C build --print-errorlogs
# }

package() {
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et: