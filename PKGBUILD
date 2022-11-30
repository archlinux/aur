# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vaults
pkgver=0.4.0
pkgrel=1
pkgdesc="An application for creating encrypted vaults for the GNOME desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/mpobaschnig/Vaults"
license=('GPL3')
depends=('libadwaita' 'fuse3' 'gocryptfs' 'cryfs')
makedepends=('git' 'meson' 'cargo')
checkdepends=('appstream-glib')
_commit=a99812291780614e1f59f16c4ff3a3ebd6588b12  # tags/0.4.0^0
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
