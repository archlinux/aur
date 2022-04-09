# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

pkgname=python-pypuppetdb
pkgver=2.5.2
pkgrel=1
pkgdesc='Library for working with the PuppetDB REST API'
arch=('any')
url='https://github.com/voxpupuli/pypuppetdb'
license=('Apache')
depends=('python-requests')
makedepends=('python-setuptools' 'python-sphinx_rtd_theme')
checkdepends=('python-pytest-cov' 'python-mock' 'python-httpretty')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/voxpupuli/pypuppetdb/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('c74bf51560a8197159c3ce13f20b7a2f29432d7698da31cd249b51a62378280c876fb4bf9ec91f97a7d913ddd375df89ded6cdbf5aef3efbddb9fc77e8fd5b31')

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
