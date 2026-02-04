# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-apeye-core
_name=${pkgname#python-}
pkgver=1.1.5
pkgrel=2
pkgdesc="Core (offline) functionality for the apeye library"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/domdfcoding/apeye-core"
depends=(
  'python'
  'python-domdf-python-tools'
  'python-idna'
)
makedepends=(
    'git'
    'python-hatchling'
    'python-build'
    'python-hatch-requirements-txt'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('1f5c85184c4c9846a7ec395ffe73fd9c17c2e939f6c191578d96aa17172cc7a6')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
