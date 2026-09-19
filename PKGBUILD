# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-sigfig
_name=${pkgname#python-}
pkgver=1.4.0
pkgrel=1
pkgdesc="Python library for rounding numbers (with expected results)"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/drakegroup/sigfig"
_pydeps=(
    sortedcontainers
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
license=('MIT')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ea818f83bffa2ee4d1dce7d4afcfddc03a9214b8aa952be4ad47b4996eba8e70')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
