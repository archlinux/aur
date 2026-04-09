# Maintainer: phlppbmm <philipp.baumm@gmx.net>
pkgname=python-agent-rtfm-git
pkgver=0.2.0
pkgrel=1
pkgdesc="Local documentation retrieval service for agent-assisted development (git)"
arch=('any')
url="https://github.com/phlppbmm/rtfm"
license=('MIT')
depends=(
    'python'
    'python-fastapi'
    'python-uvicorn'
    'python-chromadb'
    'python-gitpython'
    'python-httpx'
    'python-click'
    'python-rich'
    'python-yaml'
    'python-html2text'
    'python-beautifulsoup4'
    'python-lxml'
    'python-markdownify'
)
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
provides=('python-agent-rtfm')
conflicts=('python-agent-rtfm' 'python-agent-rtfm-bin')
source=("${pkgname}::git+https://github.com/phlppbmm/rtfm.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || \
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
