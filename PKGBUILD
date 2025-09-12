# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-t61codec
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="Pure Python X.690 implementation"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-importlib-metadata
)
makedepends=(
    python-poetry-core
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('21c238fbf897b32e5fe9450b71193a1d223abb591dd84b5da8fbc50a2c9277db')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
