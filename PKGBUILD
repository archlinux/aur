# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-phonemizer-fork
_name=${pkgname#python-}
pkgver=3.3.1
pkgrel=1
epoch=
pkgdesc="Simple text to phones converter for multiple languages"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname%-fork})
conflicts=(${pkgname%-fork})
depends=(
    python
    python-joblib
    python-typing_extensions
    # AUR
    python-dlinfo
    python-segments
)
makedepends=(
    python-hatchling
    python-build
    python-installer
    python-wheel
    python-setuptools
)
checkdepends=()
optdepends=()
options=('!strip' '!debug')
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('483a2751ea435b9859e2ddca7d4ec817e54a82f3d2ad5ad2fd8fbd40e3bdf89e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
