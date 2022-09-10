# Maintainer: Amitayas Banerjee aka ami_ba <amitayasb at gmail dot com> -> https://github.com/amitayas

pkgname='helvum-git'
_pkgname='helvum'
pkgver="0.3.4.r4.gdf72a68"
pkgrel=1
pkgdesc="A GTK patchbay for pipewire."
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/pipewire/helvum.git"
license=('GPL3')
depends=('pipewire' 'gtk4')
makedepends=('appstream-glib' 'rust' 'cargo' 'clang' 'git' 'meson')
provides=('helvum')
conflicts=('helvum')
source=("$_pkgname::git+https://gitlab.freedesktop.org/pipewire/helvum.git")
sha384sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson --prefix=/usr --buildtype=plain "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
