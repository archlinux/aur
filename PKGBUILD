# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-odxtools
_name=${pkgname#python-}
pkgver=11.0.5
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
    # argparse-addons
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
sha256sums=('d6600d29328fa7ed3d883b3670bd136796c0ca9f88919719e9d6f75ef403a311')

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
