# Maintainer: Hunter Wittenborn <me@hunterwittenborn.com>

pkgname="pulp-cli-deb"
pkgver="0.4.3"
pkgrel=1
epoch=0
pkgdesc="Command line interface to talk to pulpcore's REST API. (Deb plugin commands)"
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

    "python-pulp-glue-deb"
)
depends=(
    "python"
    "python-pulp-cli"
    "python-pulp-glue-deb"
)
optdepends=()
provides=(
    "pulp-cli-deb"
    "python-pulp-cli-deb"
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
    sed -i '/requires =.*setuptools/s/<[0-9]\+//' pyproject.toml
}


build() {
    cd "${srcdir}/pulp-cli-deb-${pkgver}"
    python -m build --wheel --no-isolation
}


package() {
    cd "pulp-cli-deb-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "${srcdir}/pulp-cli-deb-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
