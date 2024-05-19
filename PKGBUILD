# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=libastal-git
_pkgname=libastal
pkgver=r1.1425b39
pkgrel=1
pkgdesc="Building blocks for building desktop shells "
arch=('x86_64')
url="https://github.com/astal-sh/libastal"
makedepends=('git' 'gobject-introspection' 'meson' 'vala')
depends=('glib2' 'glibc' 'gtk3' 'gtk-layer-shell')
source=("git+${url}")
sha256sums=('SKIP')

pkgver(){
  cd $srcdir/$_pkgname
  # git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd $srcdir/$_pkgname
  meson install -C build --destdir "$pkgdir"
}
