# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-parts2jitx
_name=${pkgname#python-}
pkgver=0.2.1
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
source=("git+${url}.git#tag=v$pkgver")
sha256sums=('167f5053a3d88fa072270addb9310cb3b5135eb1f806e8d8ca7ef5e5624c61cc')

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
