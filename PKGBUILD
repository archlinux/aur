# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: kang <kang@insecure.ws>

_name=sphinxcontrib-newsfeed
pkgbase=python-sphinxcontrib-newsfeed
pkgname=("python-sphinxcontrib-newsfeed" "python2-sphinxcontrib-newsfeed")
pkgver=0.1.4
pkgrel=6
pkgdesc="News Feed extension for Sphinx"
arch=('any')
url="https://bitbucket.org/prometheus/sphinxcontrib-newsfeed"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
#checkdepends=('python-pytest' 'python-whoosh' 'python-sqlalchemy' 'python-xapian' 'python2-pytest' 'python2-xapian' 'python2-whoosh' 'python2-sqlalchemy')
source=("https://pypi.python.org/packages/source/s/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('96d9d0c15fca8b62f945bafc8f0eafa62df9c471f7510e2f153e47b66534e5f3041e5c01df772e6c35a9f09baa70064642f7f0fa43ccfd33dd64c2604494f2fc')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname[0]}-${pkgver}"
  cp -av "${pkgname[0]}-${pkgver}" "${pkgname[1]}-${pkgver}"
}

build() {
  cd "${pkgname[0]}-${pkgver}"
  python setup.py build
  cd ../"${pkgname[1]}-${pkgver}"
  python2 setup.py build
}

# tests disabled for now:
# https://bitbucket.org/prometheus/sphinxcontrib-newsfeed/issues/4/running-tests-during-packaging
#check() {
#  cd "${pkgname[0]}-${pkgver}"
#  export PYTHONPATH=${srcdir}/${pkgname[0]}-${pkgver}/build:${PYTHONPATH}
#  py.test
#  cd ../"${pkgname[1]}-${pkgver}"
#  export PYTHONPATH=${srcdir}/${pkgname[1]}-${pkgver}/build:${PYTHONPATH}
#  py.test2
#}

package_python-sphinxcontrib-newsfeed() {
  depends=('python-sphinx')
  cd "${pkgname[0]}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # license
  install -vDm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname[0]}/LICENSE"
  # doc
  install -vDm644 README "${pkgdir}/usr/share/doc/${pkgname[0]}/README"
}

package_python2-sphinxcontrib-newsfeed() {
  depends=('python2-sphinx')
  cd "${pkgname[1]}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # license
  install -vDm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname[1]}/LICENSE"
  # doc
  install -vDm644 README "${pkgdir}/usr/share/doc/${pkgname[1]}/README"
}

