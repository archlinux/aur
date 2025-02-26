# Maintainer: Evan Edwards <evan@ejedev.com>

pkgname=ammo-git
_pkgname=ammo
pkgver=0.1.0.r399.10a8f85
_pkgver=0.1.0
_commit=10a8f85a34b1e09fc0b4c2490be104d852ec950a
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
