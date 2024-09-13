# Maintainer:
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>

_pkgname="text-engine"
pkgname="$_pkgname-git"
pkgver=0.1.1.r154.gd78a130
pkgrel=1
pkgdesc="A lightweight rich-text framework for GTK"
url="https://github.com/mjakeman/text-engine"
license=('LGPL-2.1-or-later')
arch=('x86_64' 'aarch64')

depends=(
  'libadwaita'
  'libxml2'
)
makedepends=(
  'git'
  'meson'
)

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
