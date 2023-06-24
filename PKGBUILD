pkgname=esphome-flasher-git
_pkgname=esphome-flasher
pkgver=1.4.0.r17.gdf73bb5
pkgrel=1
pkgdesc="Simple GUI tool to flash ESPs over USB"
arch=("any")
url="https://github.com/esphome/esphome-flasher"
license=('MIT')
depends=("esptool=3.2" "python" "python-requests" "python-wxpython")
provides=("esphomeflasher")
conflicts=("esphomeflasher")
source=("${pkgname%-*}::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
