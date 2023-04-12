pkgbase='python2-numpy-1.15.2'
pkgname=('python2-numpy-1.15.2')
_module='numpy'
pkgver='1.15.2'
pkgrel=1
pkgdesc="NumPy: array processing for numbers, strings, records, and objects."
url="http://www.numpy.org"
depends=('python2')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/45/ba/2a781ebbb0cd7962cc1d12a6b65bd4eff57ffda449fdbbae4726dc05fbc3/numpy-${pkgver}.zip")
sha256sums=('27a0d018f608a3fe34ac5e2b876f4c23c47e38295c47dd0775cc294cd2614bc1')

prepare() {
  cd "${srcdir}/${_module}-${pkgver}"
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    CFLAGS+=" -ffat-lto-objects" python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/python2-numpy/"
}
