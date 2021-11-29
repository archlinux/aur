# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

pkgname=python-pypuppetdb
pkgver=2.5.1
pkgrel=1
pkgdesc='Library for working with the PuppetDB REST API'
arch=('any')
url='https://github.com/voxpupuli/pypuppetdb'
license=('Apache')
depends=('python-requests')
makedepends=('python-setuptools' 'python-sphinx_rtd_theme')
checkdepends=('python-pytest-cov' 'python-mock' 'python-httpretty')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/voxpupuli/pypuppetdb/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('1ce4a47bab6806325d4a382ea99513f92eda0e8ae9d834e04db6ae209a520ac6bb887a912583f0a4e36f000f97833902bb8e8340f5648b2a4080b8ffb0af741a')

check() {
  cd ${pkgname#python-}-${pkgver}
  sed -i '/pep8maxlinelength/d' pytest.ini
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
