# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-liger-kernel
_pkgname=Liger-Kernel
pkgver=0.8.0
pkgrel=1
pkgdesc="Efficient Triton kernels for LLM training"
arch=('any')
url="https://github.com/linkedin/Liger-Kernel"
license=('BSD-2-Clause')
depends=(
    'python'
    'python-pytorch'
    'python-triton'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
optdepends=(
    'python-transformers: for Hugging Face Transformers integration'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/linkedin/Liger-Kernel/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7474b9855d16fb5aacf3338ad6d71220023e8c28c231211403f7fe347be7597a')

build() {
    cd "$_pkgname-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    PYTHONPATH="$PWD/src:$PYTHONPATH" python -c "import liger_kernel; print('liger_kernel imported successfully')"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
