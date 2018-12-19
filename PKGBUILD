# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>
# Contributor: Jaseem Abid <jaseemabid@gmail.com>

_pkgname=gnome-usage
pkgname=$_pkgname-git
pkgver=3.30.0.10.g73966cf
pkgrel=1
pkgdesc="GNOME application to view information about use of system resources"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://wiki.gnome.org/Apps/Usage"
license=(GPL3)
depends=(gtk3 libgtop libdazzle)
makedepends=(git meson vala)
optdepends=('accountsservice: show user tags for processes')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.gnome.org/GNOME/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
