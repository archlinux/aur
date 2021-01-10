# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=instamenu-schemas
pkgver=2021.01.10
pkgrel=1
pkgdesc="addons for instamenu"
url="https://github.com/TheCynicalTeam/$pkgname"
arch=('any')
license=('CC BY-NC-SA 4.0')
provides=("instamenu-schemas=$pkgver")
depends=('glib2' 'dconf')
makedepends=('gobject-introspection' 'git' 'meson')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('a25c2be000693715e0e7d38e0998e24be6a36da22690f2258463b5296aa9ceab')

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
