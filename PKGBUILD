# Maintainer: Hunter Wittenborn <me@hunterwittenborn.com>

pkgname="pulp-glue-deb"
pkgver="0.4.3"
pkgrel=1
epoch=0
pkgdesc="Version agnostic glue library to talk to pulpcore's REST API. (deb plugin)"
arch=(
    "any"
)
url="https://github.com/pulp/pulp-cli-deb"
license=("GPL-2.0-or-later")
groups=()
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
)
depends=(
    "python"
    "python-pulp-glue"
)
optdepends=()
provides=(
    "python-pulp-glue-deb"
)
conflicts=()
replaces=()
backup=()
options=()
source=(
    "https://github.com/pulp/pulp-cli-deb/archive/${pkgver}/pulp-cli-deb-${pkgver}.tar.gz"
)
noextract=()
sha256sums=(
    "322f938e7d13e2512a41c502fbc59ff1fbca366c719ead392349dd09029a6197"
)


prepare() {
    cd "pulp-cli-deb-${pkgver}"

    # Allow for higher version of setuptools
    sed -i '/requires =.*setuptools/s/<[0-9]\+//' pulp-glue-deb/pyproject.toml
}


build() {
    cd "${srcdir}/pulp-cli-deb-${pkgver}/pulp-glue-deb"
    python -m build --wheel --no-isolation
}


package() {
    cd "pulp-cli-deb-${pkgver}/pulp-glue-deb"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "${srcdir}/pulp-cli-deb-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
