# Maintainer: linkfrg <linkfrg.dev@proton.me>
pkgname=ignis-gvc-git
_pkgname=ignis-gvc
pkgver=0.1.0.r1.g03e1dde
pkgrel=1
pkgdesc="A standalone libgvc for Ignis"
arch=('x86_64')
url="https://github.com/ignis-sh/ignis-gvc"
license=('MIT')
makedepends=(gobject-introspection
             meson
             )
depends=(glib2
         glib2-devel
         libpulse
         )

source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_pkgname
  meson subprojects download
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
