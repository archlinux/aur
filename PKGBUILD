# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

pkgname=python-pypuppetdb
pkgver=3.0.0
pkgrel=1
pkgdesc='Library for working with the PuppetDB REST API'
arch=('any')
url='https://github.com/voxpupuli/pypuppetdb'
license=('Apache')
depends=('python-requests')
makedepends=('python-setuptools' 'python-sphinx_rtd_theme')
checkdepends=('python-pytest-cov' 'python-mock' 'python-httpretty')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/voxpupuli/pypuppetdb/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('20929ec07617cec016f8c6deda241a694f6a1e4bb8a8cff1444630159615837b014a1bcdb38553edfe0a608f8f7fcf63aa4efce50f46e10ab952c512705e040f')

check() {
  cd ${pkgname#python-}-${pkgver}
  pytest
}

package() {
  cd ${pkgname#python-}-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1
  rm -rf "${pkgdir}"/usr/requirements_for_tests

  cd docs
  PYTHONPATH=.. make man
  install -D -m644 "_build/man/pypuppetdb.1" "${pkgdir}/usr/share/man/man1/pypuppetdb.1"
}

# vim:set ts=2 sw=2 et:
