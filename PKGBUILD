# Maintainer: Fatih (fatih5228) <fatih5228 at users dot noreply dot github dot com>
pkgname=legion-y520-fan-control-git
_pkgname=LegionFanControl
pkgver=2.7.1.r19.g0701acb
pkgrel=1
pkgdesc="Extreme Cooling, automatic fan mode and gaming tools for Lenovo Legion Y520-15IKBN"
arch=('any')
url="https://github.com/fatih5228/LegionFanControl"
license=('MIT')
depends=('python' 'pyside6' 'python-dbus' 'python-gobject' 'glib2' 'acpi_call' 'dmidecode' 'pciutils')
makedepends=('git')
optdepends=('nvidia-utils: GPU temperature (nvidia-smi)')
provides=('legion-fan-control')
conflicts=('legion-fan-control')
install=legion-y520-fan-control.install
source=("git+https://github.com/fatih5228/LegionFanControl.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  local ver
  ver=$(sed -n 's/^VERSION = "\(.*\)"/\1/p' linux/legionfan/__init__.py)
  printf "%s.r%s.g%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_pkgname/linux"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
