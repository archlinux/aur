# Maintainer: RiverOnVenus <aur@zhui.dev>

pkgname=whichllm
_pkgname=whichllm
pkgver=0.5.8
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
    'python-nvidia-ml-py: NVIDIA GPU detection (pulls in nvidia-utils ~900MB)'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}-git")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d419f8a0fcfbc2ecd20563cbd7ff26f90a634df8132002bd75542a353efe86c0')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
