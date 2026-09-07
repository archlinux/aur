# Maintainer: Evan Edwards <evan@ejedev.com>

pkgname=ammo-git
_pkgname=ammo
pkgver=0.1.0.r605.35fce7b
_pkgver=0.1.0
_commit=35fce7b804022fe34b41d5c0944a33f8517975de
pkgrel=2
pkgdesc="Almost Manual Mod Organizer - The Definitive CLI Mod Manager for Linux"
url="https://github.com/cyberrumor/ammo"
license=('GPL-2.0-only')
arch=('any')
depends=('python' 'uv' 'python-installer' '7zip')
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
  uv build
}

check() {
  cd "$_pkgname"
  python -m pytest -cov
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
