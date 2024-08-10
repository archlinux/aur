# Maintainer: Pablo Hernandez-Cerdan <pablo.hernandez.cerdan@outlook.com>
pkgname=python-poetry-plugin-sync-pre-commit-lock
_pkgname=sync-pre-commit-lock
pkgver=0.6.1
pkgrel=4
pkgdesc="Automatically sync pre-commit hooks version from PDM or Poetry lockfile, and install them automatically."
arch=(any)
url="https://github.com/GabDug/sync-pre-commit-lock"
license=(GPL3)
depends=(python
         python-strictyaml)
makedepends=(python-build python-installer python-wheel python-pdm-backend)
_archive="$_pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1bb7cbcabcb6a5f08a75d9b82d8cf45143e7326d7c1329116698d82df5f7dcca')

build() {
    cd "$_archive"
    export PDM_BUILD_SCM_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "$_archive"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 et:
