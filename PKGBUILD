pkgname=switcheroo-control
# Note to self: Update _commit, not pkgver
pkgver=2.6
pkgrel=1
pkgdesc="D-Bus service to check the availability of dual-GPU"
arch=(i686 x86_64)
url="https://gitlab.freedesktop.org/hadess/switcheroo-control"
license=(GPL3)
depends=(glib2 libgudev python)
makedepends=(git libxslt meson systemd)
checkdepends=(dbus-python python-dbusmock umockdev)
_commit=0dd257edd6b27589d2a1013cda1d2d5f325eee8b
source=("git+https://gitlab.freedesktop.org/hadess/switcheroo-control.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe | sed 's/-/.r/; s/-/./'
}

build() {
  arch-meson $pkgname build
  # TODO: Figure out when/how to add -Dtests=true. I think we'd need to check
  #       either for (( CHECKFUNC )) or `! check_buildenv check n`.
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim: ts=2:sw=2:et
