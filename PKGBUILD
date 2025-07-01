# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-doipclient
_name=${pkgname#python-}
pkgver=1.1.6
pkgrel=1
epoch=
pkgdesc="A Diagnostic over IP (DoIP) client implementing ISO-13400-2."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    # AUR
    python-udsoncan
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('9c29d8f72ceb6abfc825c443127d25f66b119ffc1205abfab87c4f7b7589df4c')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
