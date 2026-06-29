# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-parts2jitx
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc="Import electronic part data (LCSC, KiCad, EasyEDA) and convert to JITX component code"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/d-haldane/parts2jitx"
_pydeps=(
    requests
)
depends=(
    'python'
    "${_pydeps[@]/#/python-}"
# AUR
    easyeda2kicad
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'easyeda-pro: EasyEDA Professional Edition'
    'lceda-pro: 免费、专业、强大的国产PCB设计工具'
    'kicad: Electronic schematic and printed circuit board (PCB) design tools'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('9d47eeec5f7db13c82299bccac78a0729990f7a87bf0d9ccc7c996def8eec12d')

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
    install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
