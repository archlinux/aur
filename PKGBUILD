# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=telegraph
pkgname=$_pkgname-git
pkgdesc='Write and decode morse'
pkgver=0.1.4.r0.gd0fbf7d
pkgrel=1
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
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson Telegraph build
  ninja -C build
}

check() {
  meson test -C build --print-errorlog
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 Telegraph/README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 Telegraph/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
