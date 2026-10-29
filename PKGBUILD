# Maintainer: RiverOnVenus <aur@zhui.dev>

pkgname=whichllm
_pkgname=whichllm
pkgver=0.5.23
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
sha256sums=('46a23f10e94df3ed0383181dc100d1b83a956c6c3ad76fc9dd96bb03075a5ac4')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
