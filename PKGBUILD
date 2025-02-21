# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="gitlab-artifact-cleanup"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="A tool for cleaning up GitLab artifacts"
arch=("any")
url="https://github.com/sciapp/gitlab-artifact-cleanup"
license=("MIT")
depends=(
    "python"
    "python-gitlab"
    "python-yacl"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
source=("https://github.com/sciapp/gitlab-artifact-cleanup/archive/v${pkgver}.tar.gz")
sha256sums=("cf8b7f7954887b61d66e146dde99cc0183bc7880bd457c66d2c464cfad1bfd61")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
