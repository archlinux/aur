# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=pyt-git
pkgver=r1126.640b2c0
pkgrel=1
pkgdesc='Find security vulnerabilities in Python web applications using static analysis (Git version)'
arch=('any')
url=https://github.com/python-security/pyt
license=('GPL')
depends=('python-gitpython' 'python-graphviz' 'python-requests')
makedepends=('git' 'python-setuptools')
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd pyt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd pyt
  sed -i 's/==/>=/g' setup.py
}

build() {
  cd pyt
  python setup.py build
}

check() {
  cd pyt
  python -m tests
}

package() {
  cd pyt
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
