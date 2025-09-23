# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-hierplace
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="This PCBNEW plugin arranges the parts into groups that reflect the hierarchy in the design."
arch=('any')
url="https://pypi.org/project/hierplace"
license=(MIT)
groups=()
provides=(${_name})
conflicts=(${_name})
depends=(
    python)
makedepends=(python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('1386717bb9e6759d9b319013d6edd0f568b717f834e29d9d804ab5cc4c0d0ad0')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
