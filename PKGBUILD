# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3down2
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="Convert markdown segments into images and other transferable media"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/pykit3/k3down2"
_pydeps=(
    k3proc # AUR
    playwright
    pillow
    pylatexenc
    pygments
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
# checkdepends=(
#     python-pytest
#     python-k3ut
#     python-numpy
# )
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('872d0c621e927dbfbe5dd7211a9836715041e55a499d540e9fa0ef14e4c80366')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

# Testing is temporarily suspended due to the missing `skimage` package.
# check() {
# 	cd "${srcdir}/${_name}"
#   export PYTHONPATH="${srcdir}${PYTHONPATH:+:${PYTHONPATH}}"
# 	pytest -x
# }

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
