# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-simp-sexp
_name=${pkgname#python-}
pkgver=0.3.1
pkgrel=1
epoch=
pkgdesc="A simple S-expression parser"
arch=('any')
url="https://pypi.org/project/${_name}"
_name=${_name//-/_}
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    # AUR
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
sha256sums=('fe85fad291079ab5bca181c228282e25bc0df70741c0dee593a4216b87980b5a')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
