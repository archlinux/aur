# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_name=graspologic-native
pkgname=python-graspologic-native
pkgver=1.3.1
pkgrel=1
pkgdesc="Python native companion module to the graspologic library"
arch=('x86_64' 'aarch64')
url="https://github.com/graspologic-org/graspologic-native"
license=('MIT')
depends=(
    'glibc'
    'libgcc'
    'python'
    'python-numpy'
    'python-scipy'
)
makedepends=(
    'maturin'
    'python-installer'
    'rust'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('fa6be9c292508b8a876d45ac98ee550534d9e33fcf7129a6df8a95573101be4c')

build() {
    cd "${_name//-/_}-${pkgver}"
    maturin build --release --strip
}

package() {
    cd "${_name//-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" target/wheels/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 NOTICE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
