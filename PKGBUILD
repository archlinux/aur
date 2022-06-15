# Maintainer: nullableVoidPtr <nullableVoidPtr _ gmail _ com>

pkgname=python-qiling
_name=${pkgname#python-}
pkgver=1.4.3
pkgrel=1
pkgdesc="An advanced binary emulation framework"
url='https://qiling.io/'
arch=('any')
license=('GPL2')
depends=('python' 'python-capstone' 'python-unicorn' 'python-pefile' 'python-registry' 'python-keystone' 'python-pyelftools' 'python-gevent' 'python-multiprocess' 'python-yaml')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('b277512a49df6372e0a947fa14ea1bc1ccc84ad8f3664b9d560511d44412c9e5')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
	export PYTHONHASHSEED=0
    python setup.py install --root="${pkgdir}" -O1 --skip-build
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
