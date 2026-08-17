pkgname=lgtv-remote
pkgver=0.5.1
pkgrel=1
pkgdesc="Desktop remote control for LG webOS TVs"
arch=('any')
url="https://github.com/Zharkan/lgtv-remote"
license=('MIT')
depends=(
    'python'
    'pyside6'
    'python-qasync'
    'python-aiohttp'
    'python-aiowebostv'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('927892df7f6bfb721e478abce9fd7b70e119eaef3327a44b2aaab569a66ed8b3')

build() {
    cd "${pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 lgtv-remote.desktop \
        "$pkgdir/usr/share/applications/lgtv-remote.desktop"
    install -Dm644 icons/lgtv-remote.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/lgtv-remote.svg"
}
