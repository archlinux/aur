# Maintainer: TheRepoClub <TheRepoClub@github.com>
# Contributor: TheRepoClub <TheRepoClub@github.com>
pkgname=instamenu-schemas
pkgver=2021.04.06
pkgrel=1
pkgdesc="addons for instamenu"
url="https://github.com/The-Repo-Club/$pkgname"
arch=('any')
groups=('therepoclub')
license=('CC BY-NC-SA 4.0')
provides=("instamenu-schemas=$pkgver")
depends=('glib2' 'dconf')
makedepends=('gobject-introspection' 'git' 'meson')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('06db846c4285514f4e3a16d23792b6a69a5aac862581be1cd67095ead18dff15')

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
