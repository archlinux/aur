# shellcheck disable=SC2034,SC2154,SC2164
# shellcheck shell=bash

pkgname=fprettify
pkgver=0.3.7
pkgrel=3
pkgdesc="An auto-formatter for modern Fortran code that imposes strict whitespace formatting, written in Python."
arch=('x86_64' 'i686')
license=("GPL-3.0-or-later")
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://github.com/pseewald/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('052da19a9080a6641d3202e10572cf3d978e6bcc0e7db29c1eb8ba724e89adc7')

prepare() {
  cd "$pkgname"-"$pkgver"
  # Fix USE_RE, see https://github.com/fortran-lang/fprettify/pull/207
  sed -i -e 's/SOL_STR + "USE/SOL_STR + r"USE/' fprettify/__init__.py
}

build() {
  cd "$pkgname"-"$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"-"$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
