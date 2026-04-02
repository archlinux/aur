# Maintainer: Victor Roest <victor@xirion.net>
pkgname=python-crossrefapi
_name=${pkgname#python-}
pkgver=1.7.0
pkgrel=1
pkgdesc='Python Library that implements the endpoints of the Crossref API'
arch=('x86_64')
url='https://github.com/fabiobatalha/crossrefapi'
license=('BSD-2-Clause')
depends=('python-requests')
makedepends=('python-poetry')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('598f27a3cc1bd8d29770de284b0b1315c820de1d70894084945d5265e6fe2dae')

build() {
    cd "$_name-$pkgver"
    poetry build
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
    cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
