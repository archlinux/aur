# Maintainer:
# Contributor: Alad Wenter <alad@archlinux.org>

_pkgname="overlayfs-tools"
pkgname="$_pkgname-git"
pkgver=2024.07.r7.gd1636eb
pkgrel=2
pkgdesc="Tools for overlay filesystem"
url="https://github.com/kmxz/overlayfs-tools"
license=('WTFPL')
arch=('x86_64')

depends=(
  'glibc'
)
makedepends=(
  'attr'
  'git'
  'meson'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  mv "$pkgdir/usr/bin/overlay" "$pkgdir/usr/bin/overlayfs"
}
