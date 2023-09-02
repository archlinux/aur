# Maintainer: Maks Verver <maksverver@geocities.com>

pkgname=python-fairscale
pkgver=0.4.13
pkgrel=1
pkgdesc='PyTorch extensions for high performance and large scale training.'
arch=('any')
url='https://github.com/facebookresearch/fairscale'
license=('BSD')
source=(
    "fairscale-$pkgver.tar.gz::https://github.com/facebookresearch/fairscale/archive/refs/tags/v$pkgver.tar.gz"
    'test_single_node_adascale.patch'
)
sha512sums=('e80793c55629c04205651ab16b6d86bf5a264eaafd45a6789504fe77e53d88419fb46ad722dc505a26e078fb57f22ca9da3d45a2615295b157c27de14bc561cd'
            '477e29a756a5b6dcc1decb8f3e170e5f8ea8925eeab6719c5ae095ebf0a05bcc1eefce105ef76182d62305f308ba00b01f96fc9e0ae7c576fcd1b87d97c7e66c')
makedepends=(
    'python-parameterized'
    'python-pip'
    'python-setuptools'
    'python-scikit-learn'
)
depends=(
    'python-importlib-metadata'
    'python-numpy'
    'python-pgzip'
    'python-pygit2'
    'python-pytest'
    'python-pytorch'
    'python-torchvision'
)

prepare() {
    cd fairscale-$pkgver
    patch --forward --strip=1 --input="${srcdir}/test_single_node_adascale.patch"
}

build() {
    cd fairscale-$pkgver
    python setup.py build
}

check() {
    cd fairscale-$pkgver
    pytest
}

package() {
    cd fairscale-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
