# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgbase=python-ccm
pkgname=('python-ccm' 'python2-ccm')
_pyname='ccm'
pkgver=3.1.4
pkgrel=1
pkgdesc="A script/library to create, launch and remove an Apache Cassandra cluster on localhost"
url="http://github.com/pcmanus/ccm"
arch=('any')
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=(python-${_pyname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/c/${_pyname}/${_pyname}-${pkgver}.tar.gz)
conflicts=('ccm')
sha256sums=('a98268c2d8e5534d8d2d94267060e9ee9105b35e43d704bac0fa495a773acf7d')

prepare() {
  cp -r {,python-}${_pyname}-${pkgver}
  mv {,python2-}${_pyname}-${pkgver}
}

build() {
  for py in python{,2}; do
    pushd ${py}-${_pyname}-${pkgver}
    ${py} setup.py build
    popd
  done
}

package_python-ccm() {
  depends=('python' 'python-yaml' 'python-six' 'python-psutil' 'apache-ant')
  optdepends=('python-paramiko: execute ccm remotely')

  cd python-${_pyname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize='1' --skip-build
  mv ${pkgdir}/usr/bin/ccm ${pkgdir}/usr/bin/ccm3
}

package_python2-ccm() {
  depends=('python2' 'python2-yaml' 'python2-six' 'python2-psutil' 'apache-ant')
  optdepends=('python2-paramiko: execute ccm remotely')

  cd python2-${_pyname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize='1' --skip-build
}

# vim:set ts=2 sw=2 et:
