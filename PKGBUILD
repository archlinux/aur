# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-hupper
_pkgname=hupper
pkgver=1.4.2
pkgrel=1
pkgdesc="Integrated process monitor for developing servers."
arch=('any')
url="https://github.com/Pylons/hupper"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-watchdog' 'python-pytest-cov' 'python-pytest-runner')
source=($url/archive/${pkgver}.tar.gz)
sha256sums=('f6c65493ded2ecb5db0df451242ab65b5498abfd0bc92cd05dbab2cc920ff1e0')

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
