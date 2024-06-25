# Maintainer: Darius Niminenn <root@dnim.dev>

pkgname=tidal-dl-ng
_pkgname=${pkgname//-/_}
pkgver=0.15.6
pkgrel=1
pkgdesc='A tool for downloading music and albums from TIDAL'
arch=(any)
url='https://pypi.org/project/tidal-dl-ng/'
license=(AGPL-3.0-only)
depends=(
    'python>=3.11'
    'python-requests'
    'python-mutagen'
    'python-pycryptodome'
    'python-tidalapi'
    'python-dataclasses-json'
    'python-pathvalidate'
    'python-m3u8'
    'python-coloredlogs'
    'python-rich'
    'python-toml'
    'python-typer'
    'python-ffmpeg-python'
    'pyside6'
    'python-pyqtdarktheme'
    'python-darkdetect'
)
makedepends=(
    'python-poetry-core'
    'python-installer'
    'python-build'
)
source=(
    "https://files.pythonhosted.org/packages/source/t/$_pkgname/$_pkgname-$pkgver.tar.gz"
    "tidal-dl-ng"
    "tidal-dl-ng-gui"
)
sha256sums=('da638672088130a18aa6f3af0f181f96739af5a8d90b19e26c835f72cfc3de80'
            '1d2f9b06b7bba762f9a8770b163e001e5044a38b9d5befa8ea44fa3c98bcf172'
            'ecdc2868d0df9fa41e3bca50f3f0bcfede7543b54700f45b2095b9662da6dd9c')

prepare() {
    cd "$_pkgname-$pkgver"
    rm -rf dist
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install scripts
    install -Dm755 "${srcdir}/tidal-dl-ng" "${pkgdir}/usr/bin/tidal-dl-ng"
    install -Dm755 "${srcdir}/tidal-dl-ng-gui" "${pkgdir}/usr/bin/tidal-dl-ng-gui"
}
