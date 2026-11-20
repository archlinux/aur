# Maintainer: RiverOnVenus <aur@zhui.dev>

pkgname=whichllm
_pkgname=whichllm
pkgver=0.6.9
pkgrel=1
pkgdesc="Auto-detect your hardware and rank local LLMs by what actually fits and performs best"
arch=('any')
url="https://github.com/Andyyyy64/whichllm"
license=('MIT')
depends=(
    'python>=3.11'
    'python-typer'
    'python-rich'
    'python-httpx'
    'python-psutil'
    'python-dbgpu'
)
optdepends=(
    'python-nvidia-ml-py: NVIDIA GPU detection via NVML (pulls in nvidia-utils)'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
)
conflicts=("${_pkgname}-git")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a7cb589567fff85b1c99b06e9cb2b88566accd0cef4cb65a140151524d9f72c8')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
