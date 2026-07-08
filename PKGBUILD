# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-odxtools
_name=${pkgname#python-}
pkgver=11.2.0
pkgrel=1
epoch=
pkgdesc="Utilities to work with the ODX standard for automotive diagnostics"
arch=('any')
url="https://github.com/mercedes-benz/odxtools"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
_pydeps=(
    can
    deprecation 
    jinja
    markdownify
    packaging
    rich
    typing_extensions 
    # AUR
    argparse-addons
    bincopy 
    bitstruct 
    inquirerpy
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-setuptools
    python-setuptools-scm
)
options=('!strip')
source=("${_name}::git+${url}.git#tag=${pkgver}")
noextract=()
sha256sums=('ed81d6f8cf74849e3b7a0ddf9d4b90f7d6a33a5f8f04eac444d5344471247cab')

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
