# Maintainer: Matthieu Jolimaitre <matthieu@imagevo.fr>

pkgname=tidaler
pkgver=0.1.1
pkgrel=1
pkgdesc='A tool for downloading music and albums from TIDAL (fork of tidal-dl-ng)'
arch=(any)
url='https://pypi.org/project/tidaler/'
license=(AGPL-3.0-only)
depends=(
    'python'
    'pyqtdarktheme'
    'pyside6'
    'python-ansi2html'
    'python-coloredlogs'
    'python-dataclasses-json'
    'python-m3u8'
    'python-mutagen'
    'python-pathvalidate'
    'python-pycryptodome'
    'python-python-ffmpeg'
    'python-requests'
    'python-rich'
    'python-tidalapi'
    'python-toml'
    'python-typer'
    'qt6-svg'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-poetry-core'
)
source=(
    "https://files.pythonhosted.org/packages/source/t/$pkgname/$pkgname-$pkgver.tar.gz"
    "tidaler"
    "tidaler-gui"
    "tidaler.desktop"
)
sha256sums=(
    "640da00cfe386e22fb0b314c834c0896be77291a1d9f1c938b17e9f1f57972fe"
    "c54403170536ecc697ce37edfde0c1f3a73def571a88bef45ac85ca1d6f82e08"
    "643abeef056b8f9a93b16659faae2b0a54c6c640aaa6a37daaca8782ff8a1675"
    "1ab25f6c76a9b82a18e27a4bae09eaa73541df91e65a60faee3f42db2d80233d"
)

prepare() {
    cd "$pkgname-$pkgver"
    rm -rf dist
}

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install scripts
    install -Dm755 "${srcdir}/tidaler" "${pkgdir}/usr/bin/tidaler"
    install -Dm755 "${srcdir}/tidaler-gui" "${pkgdir}/usr/bin/tidaler-gui"

    # Install desktop file and icon
    install -Dm755 "${srcdir}/tidaler.desktop" "${pkgdir}/usr/share/applications/tidaler.desktop"
    install -Dm644 "${pkgdir}/usr/lib/python"*"/site-packages/${pkgname}/ui/icon512.png" "${pkgdir}/usr/share/pixmaps/tidaler.png"
}
