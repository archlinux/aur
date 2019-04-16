# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=(python2-x2go python-x2go)
_pkgbase=python-x2go
pkgver=0.6.0.2
pkgrel=1
pkgdesc="Python 2.x module providing X2Go client API"
url="http://www.x2go.org/"
arch=('any')
license=('AGPL')
makedepends=('python-setuptools' 'python2-setuptools' 'epydoc' 'python2-paramiko'
             'python2-xlib' 'python2-gevent')
source=("http://code.x2go.org/releases/source/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('83899a749b1c0f3c0c9acbb11bafc8b1711cb5142b4a013385dd47b0bb293908')

prepare() {
  rm -rf "python2-x2go-${pkgver}"
  cp -r "${_pkgbase}-${pkgver}" "python2-x2go-${pkgver}"
}

build() {
  cd "${_pkgbase}-${pkgver}"
  python setup.py build

  cd "${srcdir}/python2-x2go-${pkgver}"
  python2 setup.py build
}

package_python-x2go() {
  depends=('python-gevent' 'python-requests'
           'python-simplejson' 'python-xlib' 'nxproxy')
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  epydoc --name "Python X2Go" --url http://www.x2go.org --no-private \
    --html --quiet --output "${pkgdir}/usr/share/doc/${pkgname}" x2go/
}

package_python2-x2go() {
  depends=('python2-gevent' 'python2-paramiko' 'python2-requests'
           'python2-simplejson' 'python2-xlib' 'nxproxy')
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  epydoc --name "Python X2Go" --url http://www.x2go.org --no-private \
    --html --quiet --output "${pkgdir}/usr/share/doc/${pkgname}" x2go/
}

