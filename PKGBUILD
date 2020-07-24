# Maintainer: Tomasz Oponowicz <tomasz at zaxo dot biz>

# Regenerate the `.SRCINFO` file:
# $ makepkg --printsrcinfo > .SRCINFO

pkgname=markets
pkgver=0.2.0
pkgrel=1
pkgdesc="A stock, currency and cryptocurrency tracker"
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
_commit=c2ee559879d145b75f189035122259a8d3552442  # 0.2.0
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
