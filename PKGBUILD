# Maintainer: np4abdou1
pkgname=ani-cli-arabic
pkgver=2.1.5
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
sha256sums=('d9ae52e8cde925d4a266e83e613a0d9e6894580f11a2322d05a93218b1b587cc')

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
