# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-doipclient
_name=${pkgname#python-}
pkgver=1.1.5
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
sha256sums=('4fe7fdd84eba7bd911d85a4ab6164f9b9d5fcaca2d78a032df619c03a520623e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
