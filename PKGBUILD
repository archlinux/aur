# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-odxtools
_name=${pkgname#python-}
pkgver=11.3.1
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
sha256sums=('f1ab98fa5465c84ab0b0b7db49c10dd18e1c505cee92fb64b0d803cbe7ddc08c')

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
