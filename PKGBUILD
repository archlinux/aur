# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-inspice
_name=${pkgname#python-}
pkgver=1.6.4.1
pkgrel=2
epoch=
pkgdesc="Python interface to Ngspice and Xyce circuit simulators (forked from InSpice)"
arch=('any')
url="https://pypi.org/project/${_name}"
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
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('80b7144276d649175618d3076c2dccb82bacfa9d406068d4db9218e66bab3333')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
