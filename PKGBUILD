# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=pyhoca-cli
pkgver=0.5.0.2
pkgrel=1
pkgdesc="Python 2.x module providing X2Go client API"
url="http://www.x2go.org/"
arch=('any')
license=('AGPL')
makedepends=('python2-setuptools')
depends=('python2-x2go' 'python2-setproctitle')
source=("http://code.x2go.org/releases/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8261fedff24553217eba269a3c57e30b9953b37f58b09038f487637d83203d5e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's@^#!.*python$@#!/usr/bin/env python2@' "${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # Install executable
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${pkgname}"
  # Install man page
  install -m 755 -d "${pkgdir}/usr/share/man/man1"
  install -m 755 -t "${pkgdir}/usr/share/man/man1" "man/man1/${pkgname}.1"
}
