# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-sigfig
_name=${pkgname#python-}
pkgver=1.3.19
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
sha256sums=('a9e4fa37aa7595cc01b7207bfabf86cccd2d3edfddcdaa925ffd57dd77efcd9e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
