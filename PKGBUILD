# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-inspice
_name=${pkgname#python-}
pkgver=1.6.4.4
pkgrel=1
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
sha256sums=('2201ef9b0a91e290cf46ad7be35999d2c82b75b46fd4f34a73c6dba559b1a01e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
