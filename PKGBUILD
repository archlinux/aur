# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgbase=elasticsearch-py
pkgbase="${_pkgbase}16"
pkgname=('python-elasticsearch16' 'python2-elasticsearch16')
pkgver=1.6.0
pkgrel=1
pkgdesc="Official low-level client for Elasticsearch (Version 1.6)"
arch=('any')
license=('Apache')
url="https://github.com/elastic/elasticsearch-py"
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://github.com/elastic/${_pkgbase}/archive/${pkgver}.tar.gz")
md5sums=('a50f9f8c8aac9d91f5503d0c54384e87')

prepare() {
  cp -a "${srcdir}/${_pkgbase}-${pkgver}" "${srcdir}/${_pkgbase}-${pkgver}-python2"

#  find "$srcdir/Django-$pkgver-python2" -name '*.py' | \
#    xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pkgbase}-${pkgver}-python2"
  python2 setup.py build
}

package_python-elasticsearch16() {
  depends=('python' 'python-urllib3')
  provides=("python-elasticsearch=${pkgver}")
  conflicts=('python-elasticsearch')

  cd "${srcdir}/${_pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}" -O1
}

package_python2-elasticsearch16() {
  depends=('python2' 'python2-urllib3')
  provides=("python2-elasticsearch=${pkgver}")
  conflicts=('python2-elasticsearch')

  cd "${srcdir}/${_pkgbase}-${pkgver}-python2"

  python2 setup.py install --root="${pkgdir}" -O1
}
