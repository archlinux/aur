pkgname=switcheroo-control
pkgver=2.4
pkgrel=1
pkgdesc="D-Bus service to check the availability of dual-GPU"
arch=(i686 x86_64)
url="https://gitlab.freedesktop.org/hadess/switcheroo-control"
license=(GPL3)
depends=(glib2 libgudev python)
makedepends=(git libxslt meson systemd)
_commit=6d0cc8dbf69729896bc969705f84333130fb50ee
source=("git+https://gitlab.freedesktop.org/hadess/switcheroo-control.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe | sed 's/-/.r/; s/-/./'
}

build() {
  arch-meson $pkgname build

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  mkdir -p "$pkgdir/usr/share"
  mv "$pkgdir/etc/dbus-1" "$pkgdir/usr/share/dbus-1"
  rm -rf "$pkgdir/etc"
}

# vim: ts=2:sw=2:et
