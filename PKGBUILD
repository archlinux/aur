# Maintainer: Aethar <elliott.ashby88@gmail.com>

pkgname=simonwllm
_pkgname=llm
pkgver=0.25
pkgrel=2
pkgdesc="A CLI utility and Python library for interacting with Large Language Models, both via remote APIs and models that can be installed and run on your own machine."
arch=('x86_64')
url="https://github.com/simonw/llm"
license=('Apache-2.0')
makedepends=('python-installer' 'python-build')
depends=('python' 'python-click' 'python-condense-json' 'python-openai' 'python-click-default-group' 'sqlite-utils' 'python-sqlite-migrate' 'python-pydantic' 'python-yaml-git' 'python-pluggy' 'python-ulid' 'python-puremagic')
provides=('llm')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

build() {
    cd "${srcdir}" || exit
    cd "${_pkgname}-${pkgver}" || exit
    python -m build --wheel
}

package() {
    cd "${srcdir}" || exit
    cd "${_pkgname}-${pkgver}" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('SKIP')
