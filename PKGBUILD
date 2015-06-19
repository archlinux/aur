# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=python2-template2pdf
_realpkgname=template2pdf
pkgver=0.6.5
pkgrel=2
pkgdesc="Modules to render tRML template to PDF"
arch=('any')
url="http://code.google.com/p/template2pdf/"
license=('LGPL')
depends=('python-imaging' 'python-reportlab')
source=("http://pypi.python.org/packages/source/t/${_realpkgname}/${_realpkgname}-${pkgver}.tar.gz"
        "image_resolver.patch")
md5sums=('6b112bae8cb16be44f0047b77bba4697'
         '9ae0b508524c973ed0715af9e2c18953')

build() {
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  patch -Np0 -i "${srcdir}/image_resolver.patch"
  find "${srcdir}" -name '*.py' -exec sed -i -e "s|#!/usr/bin/python|#!/usr/bin/python2|" {} +
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  python2 setup.py install --root "${pkgdir}" -O1
}

# vim:set ts=2 sw=2 et:
