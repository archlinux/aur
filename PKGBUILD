# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

pkgname=python-pypuppetdb
pkgver=3.1.0
pkgrel=1
pkgdesc='Library for working with the PuppetDB REST API'
arch=('any')
url='https://github.com/voxpupuli/pypuppetdb'
license=('Apache')
depends=('python-requests')
makedepends=('python-setuptools' 'python-sphinx_rtd_theme')
checkdepends=('python-pytest-cov' 'python-mock' 'python-httpretty')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/voxpupuli/pypuppetdb/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('6a71e58024695738576bc87415565c4b25407750fcc005f593e793c0b66e71d74905cdf279bb21ea5c1927220d51341a1cf7011ad918b492ea26870d6214718e')

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
