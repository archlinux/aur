# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-migate
_name=${pkgname#python-}
pkgver=1.0.2
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
sha256sums=('5857987f011bc86b83762a934719184adfae9cb1863933ec31ae220500d61330')

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
