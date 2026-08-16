pkgname=lgtv-remote
pkgver=0.4.0
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
sha256sums=('476c12b20908366c502fbe0083f824d3c457dd7d6cdd21d5f8861c44460b1200')

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
