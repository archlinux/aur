# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-rodi
_name=${pkgname#python-}
pkgver=2.1.0
pkgrel=1
epoch=
pkgdesc="Implementation of dependency injection for Python 3"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-typing_extensions
)
makedepends=(
    flake8
    mypy
    python-black
    python-flake8-black
    python-isort
    python-build
    python-hatchling
    python-installer
    python-wheel
    python-setuptools
)
checkdepends=(
    python-pytest
    python-pytest-asyncio
    python-pytest-cov
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('7e1548361dcff5eb5e5228c752ed9a3ac1535cbdc1ba0561deeb63b686f069c5')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dvm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/

}
