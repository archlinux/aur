# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-awesomeversion
_name=${pkgname#python-}
pkgver=21.2.3
pkgrel=2
pkgdesc="One version package to rule them all."
arch=('any')
url="https://github.com/ludeeus/awesomeversion"
license=('MIT')
depends=(python-black python-pre-commit python-requests)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ludeeus/$_name/archive/refs/tags/$pkgver.tar.gz")
b2sums=('63fe640ebe90301b1bdd06ca56353e99921e182e8b78c158f6346a6cb114a7f260bc5746eb5616fb129d1054315c4c8aa87984801e293cd6025adfa59307a691')

prepare() {
    cd $_name-$pkgver

    # replace version "main" with correct version
    sed -e "s|version=\"main\"|version=\"$pkgver\"|" -i setup.py
}

build() {
    cd $_name-$pkgver

    python setup.py build
}

package() {
    cd $_name-$pkgver

    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

