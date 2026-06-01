# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-migate
_name=${pkgname#python-}
pkgver=1.1.7
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
sha256sums=('c3f0798461c9403100dc2355dcb111984b8fc096108409b0fe19c971c2a06024')

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
