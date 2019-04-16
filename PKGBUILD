# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=pyhoca-gui
pkgver=0.5.0.8
pkgrel=1
pkgdesc="Graphical client (wx) for the X2Go system"
url="http://www.x2go.org/"
arch=('any')
license=('AGPL')
makedepends=('python2-setuptools' 'python2-distutils-extra')
depends=('python2-x2go' 'python2-pycups' 'python2-setproctitle' 'python2-notify' 'wxpython')
source=("http://code.x2go.org/releases/source/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('13915a38238b0dc48ccdbc7d904bd15fe78f476d1806d343789c3fd5de002a7a')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's@^#!.*python$@#!/usr/bin/env python2@' "${pkgname}"
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
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
