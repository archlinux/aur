# Maintainer: Tobias Brox <t-arch@tobixen.no>
pkgname=inventory-md
pkgver=0.3.2
pkgrel=1
pkgdesc="A flexible markdown-based inventory management system"
url="https://github.com/tobixen/inventory-md"
arch=('any')
license=('GPL-3.0-or-later')
depends=('python' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
optdepends=(
    'python-fastapi: API server and chat functionality'
    'python-uvicorn: API server'
    'python-anthropic: Claude AI chat integration'
    'python-pyzbar: Barcode scanning'
    'python-easyocr: OCR text extraction'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tobixen/inventory-md/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7c32ccba98736678f58760fe906090ea57603b85be7b552256538b29eeeb4d0b')

build() {
    cd "${pkgname}-${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
