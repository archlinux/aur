# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicost-digikey-api-v3
_name=${pkgname#python-}
pkgver=0.1.4
pkgrel=1
pkgdesc="KiCost plugin for the Digikey PartSearch API"
provides=(${pkgname} python-digikey-api)
conflicts=(${pkgname} python-digikey-api)
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
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('a041332477f34aab66041d710946fd13a637a42fddb65f0a318de1159cf54ec2')

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
