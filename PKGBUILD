# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-hupper
_pkgname=hupper
pkgver=1.4
pkgrel=1
pkgdesc="Integrated process monitor for developing servers."
arch=('any')
url="https://github.com/Pylons/hupper"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-watchdog' 'python-pytest-cov' 'python-pytest-runner')
source=($url/archive/${pkgver}.tar.gz)
sha256sums=('aa51b83932e2c2781205f51f166f2b47c72df012fbfec5d7aca949c0aeef8b5f')

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
