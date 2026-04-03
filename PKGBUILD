# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-can-canine
# _name=${pkgname#python-}
pkgver=0.2.5
pkgrel=1
epoch=
pkgdesc="Python-can CANine"
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-can
    python-pyusb
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('dfef474b51e4d1d8e5e0649247cef8e6cd9f2abfeb590db221a1b42ffc6702ae')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    # install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
