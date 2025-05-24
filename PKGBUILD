# Maintainer:

_pkgname="aqemu"
pkgname="$_pkgname-qt6-git"
pkgver=r402.76920e5
pkgrel=1
pkgdesc="QEMU GUI written in Qt"
url="https://github.com/AQEMU/aqemu"
license=('GPL-3.0-only')
arch=('x86_64')

depends=(
  'qt6-base'
  'libvncserver'
)
makedepends=(
  'cmake'
  'git'
  'meson'
  'qt6-declarative'
  'qt6-tools'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="aqemu-qt6"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  depends+=('qemu')
  meson install -C build --destdir "$pkgdir"
}
