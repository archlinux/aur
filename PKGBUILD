# Maintainer: isbest <icoderdev@outlook.com>

_pkgname=py4j
pkgname=python-${_pkgname}
pkgver=0.10.9.7
pkgrel=2
pkgdesc="Enables Python programs to dynamically access arbitrary Java objects"
arch=('any')
url="https://www.py4j.org"
license=('GPL2')
depends=('java-runtime' 'python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('0b6e5315bb3ada5cf62ac651d107bb2ebc02def3dee9d9548e3baac644ea8dbb')

build() {
    cd "${_pkgname}-$pkgver"
    python setup.py build
}

package() {
    cd "${_pkgname}-$pkgver"
    export PYTHONHASHSEED=0
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 LICENSE.txt \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
