# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Richard Tucker <rtucker@mookins.com>

pkgname=python-textparser
_name=${pkgname#python-}
pkgver=0.26
pkgrel=1
pkgdesc="A text parser library for python"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/cantools/textparser"
_pydeps=(
)
depends=(
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
	'python-setuptools-scm'
    'python-wheel'
)
optdepends=(
    'python-cantools: Python CAN bus tools in Python 3'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=$pkgver")
sha256sums=('50e0f4052eb54c77601acc7b66f93624f001633891b29a5bc4390cf6f2b987d9')

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

