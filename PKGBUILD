# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-x690
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Pure Python X.690 implementation"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-importlib-metadata
    python-pytest
    # AUR
    python-t61codec
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
sha256sums=('d20068d3891c5710d6f25fc4db85d62b4b46bbcd07a4b994c5751ea777aa4fc0')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
