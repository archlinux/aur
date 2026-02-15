# Maintainer: skint007 <archlinux.repose742@passmail.net>
pkgname=pz-mod-manager
pkgver=0.2.2
pkgrel=1
pkgdesc="Desktop application for managing Project Zomboid server mod lists"
arch=('any')
url="https://github.com/skint007/project-zomboid-modid"
license=('MIT')
depends=(
    'python>=3.11'
    'pyside6'
    'python-requests'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "project-zomboid-modid-${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "project-zomboid-modid-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
