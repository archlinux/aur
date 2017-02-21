# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

_basename=binstruct
pkgname=python-${_basename}
pkgver=1.0.1
pkgrel=1
pkgdesc="The binstruct library allows you to access binary data using a predefined structure."
arch=('any')
url="https://github.com/Jokymon/binstruct"
license=('GPL3')
depends=('python')
makedepends=()
source=(https://github.com/Jokymon/binstruct/archive/v${pkgver}.tar.gz)
sha256sums=('b6978076b57f28f221a3369e74e291ff0ade5dc58f63e49973e220138d4e5b48')

package() {
    PYTHON_VERSION="$(python --version | cut -d' ' -f2 | cut -d'.' -f1,2)"
    cd "${srcdir}/${_basename}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    DEST="${pkgdir}/usr/lib/python${PYTHON_VERSION}/site-packages/binstruct.py"
    install -D -m 0644 ${srcdir}/${_basename}-${pkgver}/binstruct.py "${DEST}"
    python -O -m compileall "${DEST}"
}
