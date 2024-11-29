# Maintainer: Ash <xash at riseup d0t net>
# Former Maintainer: Amitayas Banerjee aka ami_ba <amitayasb at gmail dot com> -> https://github.com/amitayas

pkgname='helvum-git'
_pkgname='helvum'
pkgver=0.5.1.r15.g980bb139
pkgrel=1
pkgdesc="A GTK patchbay for pipewire."
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/pipewire/helvum.git"
license=('GPL-3.0-only')
depends=('pipewire' 'gtk4' 'libadwaita')
makedepends=('appstream-glib' 'rust' 'cargo' 'clang' 'git' 'meson')
provides=('helvum')
conflicts=('helvum')
options=(!lto)
source=("$_pkgname::git+https://gitlab.freedesktop.org/pipewire/helvum.git")
sha384sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --long --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson --prefix=/usr --buildtype=plain "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
