# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=nautilus-sendto
pkgver=3.8.6+13+gff9b88f
pkgrel=1
pkgdesc="Easily send files via mail"
url="https://git.gnome.org/browse/nautilus-sendto"
arch=(x86_64)
license=(GPL)
depends=(glib2)
makedepends=(gobject-introspection git meson appstream-glib)
groups=(gnome-extra)
_commit=ff9b88f4e4a1df4ce322426adc6feda5f9a56e37  # master
source=("git+https://git.gnome.org/browse/nautilus-sendto#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^NAUTILUS_SENDTO_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
