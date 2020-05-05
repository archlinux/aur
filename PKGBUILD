# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-msgpack-numpy
pkgver=0.4.5
pkgrel=1
pkgdesc="Serialize numpy arrays using msgpack"
url="https://pypi.org/project/msgpack-numpy/"
depends=(python-numpy
         python-msgpack)
makedepends=(python-setuptools)
license=(BSD)
arch=(any)
source=("https://files.pythonhosted.org/packages/06/e5/ab4d8174d1054da471b957c395c7e0b3eadc7aa8073dd9ee3c0e658415f9/msgpack-numpy-0.4.5.tar.gz")
sha256sums=('af26f6f839b954bf072b3e47f6d954517d6b6d6956d26097331b571545d1747c')


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
