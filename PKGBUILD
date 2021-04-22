pkgname=power-profiles-daemon
pkgver=0.8.1
pkgrel=1
pkgdesc="Makes power profiles handling available over D-Bus"
url="https://gitlab.freedesktop.org/hadess/power-profiles-daemon"
license=(GPL3)
arch=(x86_64)
depends=('systemd' 'upower')
makedepends=('git' 'meson')
checkdepends=('python-dbusmock' 'python-pylint' 'umockdev')
_commit=c4837945927c10ea82ec1c76bead6e5601a8e64d
source=("git+https://gitlab.freedesktop.org/hadess/power-profiles-daemon.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
