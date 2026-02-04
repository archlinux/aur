# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-handy-archives
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=5
pkgdesc='Handy archive helpers for Python'
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url='https://handy-archives.readthedocs.io/'
depends=('python')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'python-flit-core'
)
license=('MIT')
source=("${_name}::git+https://github.com/domdfcoding/handy-archives.git#tag=v$pkgver")
sha256sums=('65f8449e6863bd0ba87d85b1291866226edbf15324d4200da4fc69773fcec1ef')

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
