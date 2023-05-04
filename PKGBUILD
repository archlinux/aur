# Contributor: a821
# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

pkgname=python-pypuppetdb
pkgver=3.1.0
pkgrel=2
pkgdesc='Library for working with the PuppetDB REST API'
arch=('any')
url='https://github.com/voxpupuli/pypuppetdb'
license=('Apache')
depends=('python-requests')
makedepends=('python-setuptools' 'python-sphinx_rtd_theme'
             'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-cov' 'python-mock' 'python-httpretty')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/voxpupuli/pypuppetdb/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('6a71e58024695738576bc87415565c4b25407750fcc005f593e793c0b66e71d74905cdf279bb21ea5c1927220d51341a1cf7011ad918b492ea26870d6214718e')

build() {
  cd ${pkgname#python-}-${pkgver}
  python -m build --wheel --no-isolation
  cd docs
  PYTHONPATH=.. make man
}

check() {
  cd ${pkgname#python-}-${pkgver}
  pytest
}

package() {
  cd ${pkgname#python-}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -rf "${pkgdir}"/usr/requirements_for_tests

  install -D -m644 "docs/_build/man/pypuppetdb.1" "${pkgdir}/usr/share/man/man1/pypuppetdb.1"
}

# vim:set ts=2 sw=2 et:
