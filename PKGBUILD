# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-t61codec
_name=${pkgname#python-}
pkgver=3.0.0
pkgrel=1
epoch=
pkgdesc="Pure Python X.690 implementation"
arch=('any')
url="https://github.com/exhuma/t61codec"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-importlib-metadata
)
makedepends=(
    git
    python-hatchling
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}::git+${url}.git#tag=v$pkgver")
noextract=()
sha256sums=('e942fcaa9dd381d0f1526ee627fab8aaf84a214a34d829a96f633a64e3e529c2')

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
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
