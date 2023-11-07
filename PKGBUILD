# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=telegraph
pkgname=$_pkgname-git
pkgver=0.1.8
pkgrel=1
pkgdesc="Write and decode morse (latest commit)"
url="https://github.com/fkinoshita/Telegraph"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('libadwaita')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd Telegraph
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
}
