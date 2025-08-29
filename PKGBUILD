# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-csvw
_name=${pkgname#python-}
pkgver=3.5.1
pkgrel=1
epoch=
pkgdesc="Python library to work with CSVW described tabular data"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-attrs
    python-dateutil
    python-babel
    python-jsonschema
    python-isodate
    python-rdflib
    python-requests
    python-rfc3986
    python-colorama
    python-uritemplate
    # AUR
    python-language-tags
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('e13dfcbf56a51f66bd4c6b442b8b32b3fee4b615dcd9436149832b41572938f3')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
