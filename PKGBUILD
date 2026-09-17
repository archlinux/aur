# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicost-digikey-api-v4
_name=${pkgname#python-}
pkgver=0.1.4
pkgrel=1
pkgdesc="KiCost plugin for the Digikey PartSearch API"
provides=(${pkgname} python-digikey-api)
conflicts=(${pkgname} python-digikey-api)
arch=('any')
url="https://github.com/set-soft/kicost-digikey-api-v4"
_pydeps=(
    certifi
    dateutil
    inflection
    pyopenssl
    six
    urllib3
    requests
    tldextract
)
depends=(
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'kicad: Electronic schematic and printed circuit board (PCB) design tools'
    'kicost: KiCAD script to convert BOM xml into spreadsheet'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('4c244015fcf1d2c2a94b65f23c51c042331f014e030f07401aa359747637f26c')

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
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
