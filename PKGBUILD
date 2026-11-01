# Maintainer: np4abdou1
pkgname=ani-cli-arabic
pkgver=2.1.1
pkgrel=1
pkgdesc="Terminal-based anime streaming with Arabic subtitles!"
arch=('any')
url="https://github.com/np4abdou1/ani-cli-arabic"
license=('GPL3')
provides=('ani-cli-ar')
conflicts=('ani-cli-ar')
depends=('python' 'python-rich' 'python-requests' 'python-pypresence' 'python-pycryptodome' 'python-curl-cffi' 'python-beautifulsoup4' 'python-arabic-reshaper' 'python-bidi' 'python-pillow' 'python-numpy' 'mpv')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/np4abdou1/ani-cli-arabic/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dce32be6bf1a249add620e143a5194a47d5ae3469b31d293d4f83d965abc46cd')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install desktop entry
    install -Dm644 assets/ani-cli-arabic.desktop "$pkgdir/usr/share/applications/ani-cli-arabic.desktop"
    
    # Install icon
    install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/ani-cli-arabic.png"
}
