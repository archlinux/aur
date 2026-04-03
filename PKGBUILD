# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-can-damiao
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc="Python-can Damiao (达妙) USB-CAN adapter plugin"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/gaoyichuan/python-can-damiao"
_pydeps=(
    can
    pyserial
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
sha256sums=('a9518177bcfaeb8d37f1a2073989e6c9348f3d6f53a4c54418b4533cd60c08b3')

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
