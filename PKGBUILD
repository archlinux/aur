pkgname=switcheroo-control-git
_pkgname=switcheroo-control
pkgver=2.3.r6.g9bcb7b5
pkgrel=1
pkgdesc="D-Bus service to check the availability of dual-GPU"
arch=(i686 x86_64)
url="https://gitlab.freedesktop.org/hadess/switcheroo-control"
license=(GPL3)
depends=('glib2' 'libgudev' 'python')
makedepends=('git' 'libxslt' 'meson')
provides=('switcheroo-control')
conflicts=('switcheroo-control')
source=("git+https://gitlab.freedesktop.org/hadess/switcheroo-control.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe | sed 's/-/.r/; s/-/./'
}

build() {
  arch-meson $_pkgname build

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  mkdir -p "$pkgdir/usr/share"
  mv "$pkgdir/etc/dbus-1" "$pkgdir/usr/share/dbus-1"
  rm -rf "$pkgdir/etc"
}

# vim: ts=2:sw=2:et
