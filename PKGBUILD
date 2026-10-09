# Maintainer: Saren

pkgname=gnome-rounded-blur-gnome51
_pkgname=gnome-rounded-blur
pkgver=1.0.1
pkgrel=1
pkgdesc="GNOME Shell BlurEffect with rounded corners (GNOME 51 compatible)"
arch=('x86_64')
url="https://github.com/kancko/gnome-rounded-blur"
license=('GPL-3.0-only')
conflicts=("$_pkgname")
provides=("$_pkgname")
makedepends=(
  'git'
  'meson'
  'mutter'
  'glib2-devel'
  'gobject-introspection'
)
source=("git+https://github.com/kancko/${_pkgname}.git#tag=v${pkgver}"
        "gnome-51.patch")
sha256sums=('6d8b80659426d7cfbd8b9a23553fa139ba8ee1b94481bbdd457de9b1b70d7067'
            '14911978f2bcbbcc564eb1093a04cd6da2abd327377c2572d3d644115b3cee33')

prepare() {
  cd $_pkgname
  patch -Np1 -i ../gnome-51.patch
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
