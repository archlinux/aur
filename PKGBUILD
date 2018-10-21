# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-hupper
_pkgname=hupper
pkgver=1.3.1
pkgrel=1
pkgdesc="Integrated process monitor for developing servers."
arch=('any')
url="https://github.com/Pylons/hupper"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-watchdog' 'python-pytest-cov' 'python-pytest-runner')
source=($url/archive/${pkgver}.tar.gz)
sha256sums=('7152ee2c78f3d9b5bf3632d51c358cb4d1c73afae90ff2d0d9510215facec325')

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
