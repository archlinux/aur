# Maintainer: ewgsta <ewgst@proton.me>
pkgname=weeb-cli
pkgver=3.0.1
pkgrel=1
pkgdesc="No browser, no ads, no distractions. Just you and an unparalleled anime viewing experience."
arch=('any')
url="https://github.com/ewgsta/weeb-cli"
license=('GPL-3.0-only')
depends=(
    'python>=3.12'
    'python-typer'
    'python-rich'
    'python-questionary'
    'python-requests'
    'python-packaging'
    'python-beautifulsoup4'
    'python-lxml'
    'python-pycryptodome'
    'python-curl_cffi'
    'python-appdirs'
    'python-prompt_toolkit'
    'python-pyfiglet'
    'python-py7zr'
    'python-pypresence'
)
optdepends=(
    'mpv: for video playback'
    'aria2: for fast multi-connection downloads'
    'yt-dlp: for advanced stream support'
    'ffmpeg: for video processing and fallback downloads'
    'python-flask: for Torznab and RESTful API server modes'
    'python-flask-cors: for RESTful API CORS support'
    'python-yaml: for Torznab server configuration'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('SKIP') 

build() {
    cd "$srcdir/${pkgname//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
