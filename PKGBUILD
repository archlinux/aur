# Maintainer: TheRepoClub <TheRepoClub@github.com>
# Contributor: TheRepoClub <TheRepoClub@github.com>
pkgname=instamenu-schemas
pkgver=2021.04.10
pkgrel=1
pkgdesc="addons for instawm"
url="https://github.com/The-Repo-Club/$pkgname"
arch=('any')
groups=('therepoclub')
license=('CC BY-NC-SA 4.0')
provides=("instawm-schemas=$pkgver")
depends=('glib2' 'dconf')
makedepends=('gobject-introspection' 'git' 'meson')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('c8d5bf76c33e520c635daaffccdf587e37f227f70dfca1d5401e12619f723d48')

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
