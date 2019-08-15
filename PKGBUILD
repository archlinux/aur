# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-msgpack-numpy
pkgver=0.4.4.3
pkgrel=2
pkgdesc="Serialize numpy arrays using msgpack"
url="https://pypi.org/project/msgpack-numpy/"
depends=(python-numpy
         python-msgpack)
makedepends=(python-setuptools)
license=(BSD)
arch=(any)
source=("https://files.pythonhosted.org/packages/d9/1a/da2a0b729ca128c69cb2b80b29bd13e249cbeecdff6cf5ca5c42542414fc/msgpack-numpy-0.4.4.3.tar.gz")
sha256sums=('a02c0069fb580c6a2dda9b98d40d34fda3840863112a5465ba9b54fa2ee005a5')

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
