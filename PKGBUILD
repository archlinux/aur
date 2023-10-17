pkgname=power-profiles-daemon-tlp-git
_pkgname=power-profiles-daemon
pkgver=0.13+3+gbe34793
pkgrel=1
pkgdesc="Makes power profiles handling available over D-Bus, with TLP driver"
url="https://github.com/rongronggg9/power-profiles-daemon"
license=(GPL3)
arch=(x86_64)
depends=('systemd' 'upower')
optdepends=('tlp: TLP power profiles driver')
makedepends=('git' 'meson')
checkdepends=('python-dbusmock' 'python-pylint' 'umockdev')
provides=('power-profiles-daemon')
conflicts=('power-profiles-daemon' 'power-profiles-daemon-git')
source=("git+https://github.com/rongronggg9/power-profiles-daemon.git")
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
