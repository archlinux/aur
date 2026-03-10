# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=ansible-builder
pkgver=3.1.1
pkgrel=2
pkgdesc="An Ansible execution environment builder"
arch=('any')
url="https://github.com/ansible/ansible-builder"
license=('Apache-2.0')
depends=(
    'python'
    'python-jsonschema'
    'python-yaml'
    'python-packaging'
    'bash'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
optdepends=(
    'ansible: check official ansible collections'
    'docker: To use docker as a container runtime'
    'podman: To use podman as a container runtime'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('e0246b44815cf9429111320276098626719a86ed2873fdd23bf573952e7c3c10ed88d8d3b1db20dfaa328e7d5e6b72cc0235198308c7c6a0ff3e6cc1f8429784')

build() {
    cd "${pkgname}-${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
