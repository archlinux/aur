pkgname=power-profiles-daemon-git
_pkgname=power-profiles-daemon
pkgver=0.8.1
pkgrel=1
pkgdesc="Makes power profiles handling available over D-Bus"
url="https://gitlab.freedesktop.org/hadess/power-profiles-daemon"
license=(GPL3)
arch=(x86_64)
depends=('systemd' 'upower')
makedepends=('git' 'meson')
checkdepends=('python-dbusmock' 'python-pylint' 'umockdev')
provides=('power-profiles-daemon')
conflicts=('power-profiles-daemon')
source=("git+https://gitlab.freedesktop.org/hadess/power-profiles-daemon.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
