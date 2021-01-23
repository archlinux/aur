pkgname=python2-titlecase
_module='titlecase'
pkgver=0.13.1
pkgrel=1
pkgdesc="Python Port of John Gruber's titlecase.pl (old version with python2 support)"
url="https://github.com/ppannuto/python-titlecase"
depends=('python2' 'python2-nose' 'python2-regex')
makedepends=('python2-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/t/titlecase/titlecase-${pkgver}.tar.gz")
sha256sums=('5b34bea05a2b9dac22abc1455f23416b8f5f971d664b77230328dbaab5556f3d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    # Avoid conflicts with the Python 3 package
    mv "${pkgdir}/usr/bin/titlecase" "${pkgdir}/usr/bin/titlecase-py2"
}
