# Maintainer: Donien <donien.96@hotmail.com>

_projname="pulp-cli"
pkgname="pulp-glue"
pkgver="0.40.3"
pkgrel=1
epoch=0
pkgdesc="Command line interface to talk to the Pulp 3 REST API"
arch=(
    "any"
)
url="https://github.com/pulp/pulp-cli"
license=("GPL-2.0-or-later")
groups=()
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"

    "python-tomli-w"
    "python-schema"
    "python-multidict"
)
depends=(
    "python"
    "python-tomli-w"
    "python-schema"
    "python-multidict"
    "python-pydantic"

    "python-packaging"
    "python-yaml"
)
optdepends=(
    "python-pygments"
    "python-click"
)
provides=(
    "python-pulp-glue"
)
conflicts=()
replaces=()
backup=()
options=()
changelog="pulp-glue.changelog"
source=(
    "https://github.com/pulp/${_projname}/archive/${pkgver}/${_projname}-${pkgver}.tar.gz"
)
noextract=()
sha256sums=(
    "a9a2ffde5391ab617068589f14d60a7a03afca2395a6dd657c88aa4784e7ade2"
)


prepare() {
    cd "${srcdir}/${_projname}-${pkgver}"

    # Allow for higher version of setuptools - pulp-glue
    sed -i '/requires =.*setuptools/s/<[0-9]\+//' pulp-glue/pyproject.toml
}


build() {
    # Build pulp-glue
    cd "${srcdir}/${_projname}-${pkgver}/pulp-glue"
    python -m build --wheel \
        --no-isolation \
        #--skip-dependency-check
}


package() {
    cd "${_projname}-${pkgver}/pulp-glue"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "${srcdir}/${_projname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/pulp-glue/LICENSE"
}
