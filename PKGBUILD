# Maintainer: np4abdou1
pkgname=ani-cli-arabic
pkgver=1.8.1
pkgrel=1
pkgdesc="Terminal-based anime streaming with Arabic subtitles!"
arch=('any')
url="https://github.com/np4abdou1/ani-cli-arabic"
license=('GPL3')
provides=('ani-cli-ar')
conflicts=('ani-cli-ar')
depends=('python' 'python-rich' 'python-requests' 'python-pypresence' 'python-cryptography' 'yt-dlp' 'python-pillow' 'python-numpy' 'mpv' 'fzf')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/np4abdou1/ani-cli-arabic/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('289634c7a8b51c3f92985f7e51b518689ec0a71300b9e4efdbb55ff5953246e1')

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
