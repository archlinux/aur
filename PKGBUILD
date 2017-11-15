# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=3.8.6
pkgrel=1
pkgdesc="Easily send files via mail"
url="https://git.gnome.org/browse/nautilus-sendto"
arch=(x86_64)
license=(GPL)
depends=(glib2)
makedepends=(gobject-introspection git meson appstream-glib)
groups=('gnome-extra')
_commit=c1a5c66701c80eab5df5f8a66595c686df12aa84  # tags/NAUTILUS_SENDTO_3_8_6^0
source=("git+https://git.gnome.org/browse/nautilus-sendto#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^NAUTILUS_SENDTO_//;s/_/./g;s/-/+/g'
}

prepare() {
  mkdir build
  cd $pkgname
}

build() {
  cd build
  meson --prefix=/usr --buildtype=release ../$pkgname
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
