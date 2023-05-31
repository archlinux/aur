# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=telegraph
pkgname=$_pkgname-git
pkgdesc='Write and decode morse (latest commit)'
pkgver=0.1.6
pkgrel=2
arch=('any')
url="https://github.com/fkinoshita/Telegraph"
license=('GPL3')
depends=('python' 'libadwaita')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd Telegraph
  git describe --long --tags | sed 's/\([^-]*-g\)/\1/;s/-/./g'
}

build() {
  arch-meson Telegraph build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 Telegraph/README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 Telegraph/COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
}
