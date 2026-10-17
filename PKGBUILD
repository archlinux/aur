# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-csvw
_name=${pkgname#python-}
pkgver=4.1.1
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
    python-termcolor
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
sha256sums=('5714d43d744e4069e2b6d0e58a67829ca1bf8d0578aad92cfc74e87d69e6cb31')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
