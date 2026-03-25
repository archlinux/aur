# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-inspice
_name=${pkgname#python-}
pkgver=1.7.0.1
pkgrel=1
epoch=
pkgdesc="Python interface to Ngspice and Xyce circuit simulators (forked from InSpice)"
arch=('any')
url="https://github.com/insim-ai/InSpice"
license=(AGPL-3.0-or-later)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-beautifulsoup4
    python-cffi
    python-colorama
    python-h5py
    python-matplotlib
    python-numpy
    python-requests
    python-regex
    python-ply
    python-pint
    python-yaml
    # AUR
    python-diskcache
)
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}::git+${url}.git#tag=v$pkgver")
noextract=()
sha256sums=('ebdc9577298679fa7536a83b7adb88290d17c368b606e5c18849d3508afbd43c')

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
    install -Dm0644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
