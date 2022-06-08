pkgname=switcheroo-control
pkgver=2.5
pkgrel=3
pkgdesc="D-Bus service to check the availability of dual-GPU"
arch=(i686 x86_64)
url="https://gitlab.freedesktop.org/hadess/switcheroo-control"
license=(GPL3)
depends=(glib2 libgudev python)
makedepends=(git libxslt meson systemd)
# test dependencies need to be present for unittest_inspector at build time
makedepends+=(dbus-python python-dbusmock umockdev)
checkdepends=(dbus-python python-dbusmock umockdev)
_commit=992977918026e4eec352d38728b2e55f73fd02d2
source=("git+https://gitlab.freedesktop.org/hadess/switcheroo-control.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe | sed 's/-/.r/; s/-/./'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim: ts=2:sw=2:et
