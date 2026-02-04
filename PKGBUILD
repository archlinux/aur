# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-compact-json
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.8.2
pkgrel=1
pkgdesc="A JSON formatter that produces compact but human-readable"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://pypi.org/project/compact-json"
_pydeps=(
    wcwidth
    importlib-resources
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    'python-poetry-core'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
license=('MIT')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('dc200148695be04b91ac45cd3cda531aa017fb25609b66b9961a008db25eae77')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
