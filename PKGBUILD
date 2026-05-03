# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-migate
_name=${pkgname#python-}
pkgver=1.1.5
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
sha256sums=('0f6dee0ed4ce26706492ee3c6eee931faed63d867f4d3c1e9b1d53ab1bde0230')

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
