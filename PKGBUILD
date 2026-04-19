# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pytest-curio
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=1
pkgdesc='Launch pytest with curio'
arch=('any')
url="https://github.com/johnnoone/pytest-curio"
license=('Apache-2.0')
_pydeps=(
    curio
	pytest
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-setuptools
	python-versioneer
)
options=('!strip' '!debug')
source=("${_name}::git+${url}.git#tag=v${pkgver}")
sha256sums=('b524371d4d4b4a96a36fd1d62d822c9697f5d24024bd9bfb700c2186252841da')

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
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
