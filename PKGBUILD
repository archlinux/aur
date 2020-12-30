# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=instamenu-schemas
pkgver=2020.12.30
pkgrel=1
pkgdesc="addons for instamenu"
url="https://github.com/TheCynicalTeam/$pkgname"
arch=('any')
license=('GPL3')
provides=("instamenu-schemas=$pkgver")
depends=('glib2' 'dconf')
makedepends=('gobject-introspection' 'git' 'meson')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('e27a6c7410189f8cac0ead986affbd1689334d9bae7a1f6ce9854a9c31c88383')

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
