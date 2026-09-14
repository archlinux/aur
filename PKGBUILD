# Maintainer: taotieren <admin@taotieren.com>

pkgname=easyeda2kicad
_name=${pkgname}
pkgver=1.0.1
pkgrel=2
pkgdesc="A Python script that convert any electronic components from LCSC or EasyEDA to a Kicad library"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/uPesy/easyeda2kicad.py"
_pydeps=(
    requests
    pydantic)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
license=('AGPL-3.0-or-later')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('e8b11a19b806cb38f45fc2f075a0493890637247c87446df370ab298b3c5e50e')

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
    install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
