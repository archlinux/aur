# Maintainer: envolution
# Contributor: Vekhir <vekhir at yahoo dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-audioop
pkgver=0.2.1
pkgrel=2
pkgdesc="An LTS port of Python's 'audioop' module."
arch=('any')
url="https://github.com/AbstractUmbra/audioop"
license=('PSF-2.0')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
provides=("python-audioop-lts=${pkgver}")
source=("$pkgname-$pkgver::git+https://github.com/AbstractUmbra/audioop.git#tag=$pkgver")
sha512sums=('473358b4c634225511d802a45bc0dd419fce8f030cacbac7e4a1de160112aab39a35f9c2c0904f518d5c3c2dd03b7f217194863140ec8f51f564e025b5b8d959')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "$pkgname-$pkgver"/dist/*.whl
  test-env/bin/python -m pytest "$pkgname-$pkgver"/tests
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
