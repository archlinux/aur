# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=whatip
pkgver=1.0+29+geb8584c
pkgrel=1
pkgdesc="Info on your IP"
arch=('any')
url="https://gabmus.gitlab.io/whatip"
license=('GPL3')
depends=('gtk4' 'iproute2' 'libadwaita' 'python-requests' 'python-netaddr'
         'python-gobject' 'python-iperf3')
makedepends=('git' 'meson' 'gobject-introspection')
optdepends=('avahi: hostname resolution')
checkdepends=('appstream')
_commit=eb8584c3ba1ed7f342c2255f95e2baba514dfc18
source=("git+https://gitlab.gnome.org/GabMus/whatip.git#commit=$_commit")
#source=("https://gitlab.gnome.org/GabMus/whatip/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
