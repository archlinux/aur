# Maintainer: Donien <donien.96@hotmail.com>

_projname="pulp-cli"
pkgname="pulp-glue"
pkgver="0.34.0"
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
changelog="pulp-cli.changelog"
source=(
    "https://github.com/pulp/${_projname}/archive/${pkgver}/${_projname}-${pkgver}.tar.gz"
)
noextract=()
sha256sums=(
    "717c38fc488226e8f85536b570737155343eab95802de69b645d70a784396b72"
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
