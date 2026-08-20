# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-odxtools
_name=${pkgname#python-}
pkgver=11.5.1
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
sha256sums=('841bb9990c51addecd38b9e3f4918d061b62ac74e13ff7c22758dcba12234805')

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
