# Maintainer: tctinh <titantwoshot@gmail.com>
# steamos-manager fork with native ACPI/ALIB TDP control for GPD Win Mini

pkgname=steamos-manager-gpdwinmini-git
pkgver=r702.g365f5d3
pkgrel=1
pkgdesc="SteamOS Manager with native ACPI/ALIB TDP control for GPD Win Mini (VCS)"
arch=('x86_64')
url="https://github.com/tctinh/steamos-manager-gpd"
license=('MIT')
depends=(
  'glib2'
  'libspeechd'
  'systemd-libs'
  'dbus'
  'tuned'
)
optdepends=(
  'acpi_call-dkms: Required for GPD Win Mini TDP control via ACPI/ALIB'
  'tuned-ppd: Map KDE/GNOME power-profile selector onto the GPD tuned profiles (replaces power-profiles-daemon)'
)
makedepends=(
  'git'
  'rust'
  'cargo'
  'clang'
)
provides=('steamos-manager')
conflicts=('steamos-manager' 'steamos-manager-gpdwinmini')
options=(!lto)
install=steamos-manager.install
source=("$pkgname::git+https://github.com/tctinh/steamos-manager-gpd.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make build
}

package() {
  cd "$srcdir/$pkgname"
  make install DESTDIR="$pkgdir"
}
