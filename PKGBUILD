# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Bailey Fox <bfox200012@gmail.com>

pkgname=('python-crccheck')
_module=${pkgname#python-}
pkgver='1.0'
pkgrel=2
pkgdesc="Calculation library for CRCs and checksums"
url="https://sourceforge.net/projects/crccheck"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('17c42dc4f069308ae962b682b2974bdbf2f80ee682c7032a9df44880fca3c9ab')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    python_version="$(python -c "import sys;v=sys.version_info;print(f'{v[0]}.{v[1]}')")"
    rm -r ${pkgdir}/usr/lib/python${python_version}/site-packages/tests/
}
