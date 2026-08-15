pkgname=lgtv-remote
pkgver=0.2.0
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
sha256sums=('c45e67493fda14e1fd54248f307e2632df6721b987dea065eee779cc21cb0567')

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
