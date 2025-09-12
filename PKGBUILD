# Maintainer: Evan Edwards <evan@ejedev.com>

pkgname=ammo-git
_pkgname=ammo
pkgver=0.1.0.r542.4787cc4
_pkgver=0.1.0
_commit=4787cc4988658562b3f46ec9538c9ea289670467
pkgrel=1
pkgdesc="Almost Manual Mod Organizer - The Definitive CLI Mod Manager for Linux"
url="https://github.com/cyberrumor/ammo"
license=('GPL-2.0-only')
arch=('any')
depends=('python' '7zip')
provides=('ammo')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov')
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
  python -m pytest -cov
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
