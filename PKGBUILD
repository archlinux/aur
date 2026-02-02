# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-underthesea-core
_name=${pkgname#python-}
pkgver=3.0.5
pkgrel=1
epoch=
pkgdesc="Underthesea Core"
arch=($CARCH)
url="https://pypi.org/project/${_name}"
_name=${_name//-/_}
license=(GPL-3.0-or-later)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    gcc-libs
    glibc
    python
)
makedepends=(
    maturin
    python-maturin
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
# options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('b03ca752b49045b8bb7fbc7fe5b38a10b53cd53d4077350ad6906d30d95d2a55')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    #     sed -i 's|0.15.0|0.25.1|g' Cargo.toml
    #     sed -i -e 's|PyModule)|Bound<PyModule>)|' \
    #         -e '/use pyo3\s*::.*;/a use pyo3::types::PyModule;' src/lib.rs
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    #     install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
