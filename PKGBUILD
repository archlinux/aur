# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-handy-archives
_name=${pkgname#python-}
pkgver=0.3.0
pkgrel=4
pkgdesc='Handy archive helpers for Python'
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url='https://handy-archives.readthedocs.io/'
depends=(
    'python'
    'python-coincidence'
    'python-pytest'
)
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
sha256sums=('b3054aa2f2ad87d2a545d4e5d34431d355b1fbbfd2511b1ef2948e5ff24b52b9')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}"
    git cherry-pick -n 57eeb8a5da257d787cc978f7dd4796fc9335a29b
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
