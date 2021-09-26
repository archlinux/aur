# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=pyhoca-gui
pkgver=0.6.1.1
pkgrel=1
pkgdesc="Graphical client (wx) for the X2Go system"
url="http://www.x2go.org/"
arch=('any')
license=('AGPL')
makedepends=('python-setuptools' 'python-distutils-extra')
depends=('python-x2go' 'python-pycups' 'python-setproctitle' 'python-wxpython')
source=("http://code.x2go.org/releases/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4c71e74b19c4e820e1e38b22f16da4cf46cc852e1c95fd4d3d4153dc4fd1b22a')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's@^#!.*python$@#!/usr/bin/env python2@' "${pkgname}"
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # Install executable
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${pkgname}"
  # Install man page
  install -m 755 -d "${pkgdir}/usr/share/man/man1"
  install -m 644 -t "${pkgdir}/usr/share/man/man1" "man/man1/${pkgname}.1"
  # Install documentation
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    ChangeLog README README.Unity README.i18n README.ssh-agent TODO
}
