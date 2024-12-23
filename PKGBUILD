# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-mammoth
pkgver=1.8.0
pkgrel=2
pkgdesc="Convert Word documents (.docx files) to HTML"
arch=(any)
url="https://github.com/mwilliamson/python-mammoth"
license=(MIT)
depends=(
  python
  python-cobble
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  #  puthon-funk
  #  python-pytest  too many of these don't exist yet
  #  python-precisely
  #  python-pyflakes
  #  python-spur.local
  #  python-tempman
)
depends=(python)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mwilliamson/python-mammoth/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3f5204fe95e3a39129f87a8c18b34090cabd0e7e5bc1d8700070dbabc8cc3c47')

prepare() {
  cd "$pkgname-$pkgver"
  cp README.md README

}
build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  #  python -m pytest # missing modules to perform tests
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
