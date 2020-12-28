# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=instamenu-schemas
pkgver=2020.12.28
pkgrel=2
pkgdesc="addons for instamenu"
url="https://github.com/TheCynicalTeam/$pkgname"
arch=('any')
license=('GNU General Public License v3.0')
provides=("instamenu-schemas=$pkgver")
depends=('glib2' 'dconf')
makedepends=('gobject-introspection' 'git' 'meson')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('2c9aee75142473f3eca45e7d1c6d369001477d43bd1d8a43029551730d3c5940')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  arch-meson $srcdir/$pkgname-$pkgver build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
