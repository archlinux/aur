# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-preggy
_name=${pkgname#python-}
pkgver=1.4.4
pkgrel=1
pkgdesc="assertion library for Python"
arch=('any')
url="https://pypi.org/project/preggy"
license=('MIT')
depends=(python-six python-colorama python-unidecode)
makedepends=('python-setuptools')
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
b2sums=('ed656f848349c0cdb0f44151ded15db1b68b7358a4633417a6889b4be9397dc0de96dbd5f43bb26f748d9cd4f16532f1954f3978690afa9e792ce24fbe942b20')

build() {
    cd $_name-$pkgver

    python setup.py build
}

check() {
    cd $_name-$pkgver
    pytest
}

package() {
    cd $_name-$pkgver

    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
