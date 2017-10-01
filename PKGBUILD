# Maintainer: Tim Meusel <tim@bastelfreak.de>
pkgbase=python-pecan
pkgname=('python2-pecan' 'python-pecan')
pkgver=1.2.1
pkgrel=1
arch=('any')
url='https://github.com/pecan/pecan'
license=('BSD')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools' 'python-tox' 'python-sphinx')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pecan/pecan/archive/${pkgver}.tar.gz")
sha512sums=('eced82e4c3ceaaf9b2d6135da9e108b6334f56fc9e356ea05cfa7a7048c41eba019b87e1e793e310b95aa0740314aa6235ff24fc1735f222da741390c44a8735')
pkgdesc='A WSGI object-dispatching web framework, designed to be lean and fast with few dependencies.'

check() {
  cd "${srcdir}/pecan-${pkgver}"
  # run tests only on platforms we support on Arch Linux
  #sed -i 's/envlist.*/envlist = py27,py36,scaffolds-27,scaffolds-36,scaffolds-27-rest-api,scaffolds-36-rest-api,pep8/' tox.ini
  # upstream currently ships no tests for python3.6, only 3.5 and older 3.X
  sed -i 's/envlist.*/envlist = py27,scaffolds-27,scaffolds-27-rest-api,pep8/' tox.ini
  tox
}

package_python2-pecan() {
  depends=('python2')
  cd "${srcdir}/pecan-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # manpages are currently broken
  #cd docs
  #make man
  # install -D -m644 "${srcdir}/pecan-${pkgver}/docs/build/man/pecan.1" "${pkgdir}/usr/share/man/man1/pecan.1"
}

package_python-pecan() {
  depends=('python')
  cd "${srcdir}/pecan-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  #cd docs
  #make man
  # install -D -m644 "${srcdir}/pecan-${pkgver}/docs/build/man/pecan.1" "${pkgdir}/usr/share/man/man1/pecan.1"
}
