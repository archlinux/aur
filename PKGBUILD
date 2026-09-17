# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicost-digikey-api-v3
_name=${pkgname#python-}
pkgver=0.1.5
pkgrel=1
pkgdesc="KiCost plugin for the Digikey PartSearch API"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/set-soft/kicost-digikey-api-v3"
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
license=('GPL-3.0-or-later')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('5972d586b2430ad06ffaea5f3e1f8cab54dd6d31c55b402005e514a59eaafb57')

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
