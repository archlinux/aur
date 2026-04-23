# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-migate
_name=${pkgname#python-}
pkgver=1.1.2
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
sha256sums=('88a3b35ae395ad0ef38b0f256893e644732da8d226f54970244bb3eb30a923e5')

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
