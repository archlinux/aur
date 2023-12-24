# Maintainer: efindus <aur at efindus dot com>

pkgname=power-profiles-daemon-multi-drv-git
_pkgname=power-profiles-daemon
pkgver=0.13+8+g0086cd7
pkgrel=1
pkgdesc="Makes power profiles handling available over D-Bus (with multi-driver support by Mario Limonciello)"
url="https://gitlab.freedesktop.org/superm1/power-profiles-daemon/-/tree/mlimonci/multi-drivers"
license=(GPL3)
arch=(x86_64)
depends=('upower' 'polkit')
optdepends=('python-gobject: for powerprofilesctl')
makedepends=('git' 'meson' 'ninja')
checkdepends=('python-dbusmock' 'python-pylint' 'umockdev')
provides=('power-profiles-daemon')
conflicts=('power-profiles-daemon')
source=("git+https://gitlab.freedesktop.org/superm1/power-profiles-daemon.git#branch=mlimonci/multi-drivers")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname _build
}

check() {
  meson test -C _build
}

package() {
  DESTDIR="$pkgdir" ninja -v -C _build install
}
