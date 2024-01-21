# Maintainer:
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

_pkgname="health"
pkgname="$_pkgname"
pkgver=0.95.0
pkgrel=1
pkgdesc="A health tracking app for the GNOME desktop"
url="https://gitlab.gnome.org/World/Health"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'gtk4'
  'libadwaita'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'rust'
)

provides=("gnome-health=$pkgver")
conflicts=("gnome-health")

_pkgsrc="Health-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/-/archive/$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('bf712d2142824d209a7992107620b3d9523c6315f5c6689faa027b8cbcb26fd5')

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
