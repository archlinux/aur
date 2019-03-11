# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-msgpack-numpy
pkgver=0.4.4.2
pkgrel=2
pkgdesc="Serialize numpy arrays using msgpack"
url="https://pypi.org/project/msgpack-numpy/"
depends=(python-numpy
         python-msgpack)
makedepends=(python-setuptools)
license=(BSD)
arch=(any)
source=("https://files.pythonhosted.org/packages/b8/70/5d804a4ff26788d5b5abcebeb57498e45c33816957edb5cea38982c69a93/msgpack-numpy-0.4.4.2.tar.gz")
sha256sums=('a1638108538aaba55bebaef9d847dfb3064bb1c829e68301716a6a956fa6a0d6')

prepare() {
    cd "msgpack-numpy-${pkgver}"
    chmod 755 msgpack_numpy.egg-info
    chmod 644 $(find . -type f)
    chmod 644 $(find msgpack_numpy.egg-info -type f)

}

build() {
    cd "msgpack-numpy-${pkgver}"
    python setup.py build
}

package() {
    cd "msgpack-numpy-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
