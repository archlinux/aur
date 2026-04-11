# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=ansible-builder
pkgver=3.1.1
pkgrel=3
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
    'git'
)
optdepends=(
    'ansible: check official ansible collections'
    'docker: To use docker as a container runtime'
    'podman: To use podman as a container runtime'
)
source=("$pkgname::git+$url.git#tag=$pkgver")
b2sums=('d34372ae84688db8ce5788de269212be96fe531b66053c8c812b70519a928ef8b0004beff0a56264660c7575ce3645d7b4bc6d2a40a7bacff6aaf1629b143f4f')

build() {
    cd "${pkgname}"
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
