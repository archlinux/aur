# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-hupper
_pkgname=hupper
pkgver=1.6
pkgrel=1
pkgdesc="Integrated process monitor for developing servers."
arch=('any')
url="https://github.com/Pylons/hupper"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-watchdog' 'python-pytest-cov' 'python-pytest-runner')
source=($url/archive/${pkgver}.tar.gz)
sha256sums=('4f1759a7b4be2a7d64d17375bb5976bb4a4d816f05734f3769baaee7ca260e15')

build(){
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

check(){
    cd ${_pkgname}-${pkgver}
    python setup.py pytest -v
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
    install -D LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
