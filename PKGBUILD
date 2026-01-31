# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-underthesea-core
_name=${pkgname#python-}
pkgver=2.0.0
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
sha256sums=('bd2290302a46c22806addd65c019ba89458c430dc9fd04b7fb3d138301bbdb26')

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
