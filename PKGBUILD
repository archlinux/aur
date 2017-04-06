# PyPuppetDB: Installer: Arch
# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

pkgbase=python-pypuppetdb
pkgname=('python2-pypuppetdb' 'python-pypuppetdb')
pkgver=0.3.2
pkgrel=1
arch=('any')
url='https://github.com/voxpupuli/pypuppetdb'
license=('APACHE')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools' 'python-sphinx' 'bandit')
checkdepends=('python2-pbr' 'python-pytest-cov' 'python-mock' 'python-httpretty')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/voxpupuli/pypuppetdb/archive/v${pkgver}.tar.gz")
sha512sums=('b402850ad40e40c544923de3556385249559a42c898eda257a3431b91d4b237c354a3165bb208641e3133b36ce510797fe6471626be8a64716e67c2913d12756')

check() {
  cd "${srcdir}/pypuppetdb-${pkgver}"
  #py.test --cov=pypuppetdb -v # <- currently broken upstream
  ./bandit.sh
}

package_python2-pypuppetdb() {
  pkgdesc='Python library for working with the PuppetDB API (Python 2 version)'
  depends=('python2' 'python2-requests' 'python2-httpretty')
  cd "${srcdir}/pypuppetdb-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd docs
  make man
  install -D -m644 "${srcdir}/pypuppetdb-${pkgver}/docs/_build/man/pypuppetdb.1" "${pkgdir}/usr/share/man/man1/pypuppetdb.1"
}

package_python-pypuppetdb() {
  depends=('python>=3.3.0-1' 'python-requests' 'python-httpretty')
  pkgdesc='Python library for working with the PuppetDB API (Python 3 version)'
  cd "${srcdir}/pypuppetdb-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd docs
  make man
  install -D -m644 "${srcdir}/pypuppetdb-${pkgver}/docs/_build/man/pypuppetdb.1" "${pkgdir}/usr/share/man/man1/pypuppetdb.1"
}
# vim:set ts=2 sw=2 et:

