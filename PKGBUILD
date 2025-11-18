# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=ansible-builder
pkgver=3.1.1
pkgrel=1
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
b2sums=('af563f71b697e2294fc787a632351f3516ca3e11a33422254bd283082bfae8625629c4744a3f9de450453c77ed866ea2de21dd14b8c242b2f49ce3e4f8083d41')

build() {
    cd "${pkgname}-${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
