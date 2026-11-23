# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3ut
_name=${pkgname#python-}
pkgver=0.1.23
pkgrel=3
pkgdesc="Unittest utilities with debug logging and test helpers"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/pykit3/k3ut"
_pydeps=(
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
checkdepends=(
    python-pytest
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('45b7acb6f412c777a40be0fe0ef837c275abc5e3a63c82349016d42d804fab9e')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}"
	pytest -x
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
