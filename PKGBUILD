# Maintainer: 954510662-bot <954510662@qq.com>
# Contributor: Volt Contributors

pkgname=volt-llm
pkgver=0.2.0
pkgrel=1
pkgdesc="Volt — vLLM desktop manager: one-click model download, vLLM launcher, API key management"
arch=('any')
url="https://github.com/954510662-bot/Volt"
license=('MIT')
depends=('python>=3.10' 'pyside6' 'python-fastapi' 'uvicorn'
         'python-httpx' 'python-pydantic' 'python-aiosqlite' 'python-psutil'
         'python-huggingface-hub' 'python-pip')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
optdepends=('python-pynvml: GPU monitoring'
            'nvidia-open: NVIDIA GPU driver'
            'nvidia-utils: NVIDIA utilities'
            'vllm: inference engine (can be installed from within the app)')
provides=('volt-llm' 'vllm-desktop')
conflicts=('vllm-desktop')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/954510662-bot/Volt/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/Volt-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/Volt-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    # 桌面图标
    install -Dm644 assets/volt-icon.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/volt-icon.svg"
    install -Dm644 assets/volt-icon-64.png \
        "${pkgdir}/usr/share/icons/hicolor/64x64/apps/volt-icon.png"
    install -Dm644 assets/volt-icon-128.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/volt-icon.png"
    install -Dm644 assets/volt-icon-256.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/volt-icon.png"

    # Desktop entry
    install -Dm644 assets/volt.desktop \
        "${pkgdir}/usr/share/applications/volt.desktop"

    # 应用数据目录
    mkdir -p "${pkgdir}/usr/share/volt"
}
