# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-migate
_name=${pkgname#python-}
pkgver=1.1.8
pkgrel=1
pkgdesc="migate is a simplified Xiaomi authentication gateway for Python projects"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/offici5l/migate"
_pydeps=(
    requests
    rich
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('5d06fd312d3869e638943b56b8779de846c6103d683ad12dd599173281a8b896')

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
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
