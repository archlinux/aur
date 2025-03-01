# Maintainer: Evan Edwards <evan@ejedev.com>

pkgname=ammo-git
_pkgname=ammo
pkgver=0.1.0.r403.1ea7590
_pkgver=0.1.0
_commit=1ea75902eb2c12e09e51b11bcebdf3ea75a06642
pkgrel=1
pkgdesc="Almost Manual Mod Organizer - Linux MO for Bethesda Games"
url="https://github.com/cyberrumor/ammo"
license=('GPL-2.0')
arch=('any')
depends=('python' '7zip')
provides=('ammo')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
source=("git+https://github.com/cyberrumor/ammo.git#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s.%s" "$_pkgver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  python setup.py build
}

check() {
  cd "$_pkgname"
  python -m pytest
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
