# Maintainer: machinehum
pkgname=python-chipwhisperer
pkgver=6.0.0
pkgrel=1
pkgdesc="ChipWhisperer Side-Channel Analysis Tool"
arch=('any')
url="https://www.chipwhisperer.com"
license=('GPL-2.0-or-later')
depends=(
    'python'
    'python-pyserial'
    'python-numpy'
    'python-configobj'
    'python-libusb1'
    'python-ecpy'
    'python-fastdtw'
    'cython'
    'python-tqdm'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
source=("https://github.com/newaetech/chipwhisperer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "chipwhisperer-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "chipwhisperer-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 50-newae.rules "$pkgdir/usr/lib/udev/rules.d/50-newae.rules"
}
