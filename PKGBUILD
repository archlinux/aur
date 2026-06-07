# Maintainer: leoallday
pkgname=mov-watch
pkgver=2.3.0
pkgrel=1
pkgdesc="Terminal-based movie and TV show streaming"
arch=('any')
url="https://github.com/leoallday/mov-watch"
license=('MIT')
provides=('mov-watch')
conflicts=('mov-watch')
depends=('python' 'python-rich' 'python-requests' 'python-pypresence' 'python-playwright' 'yt-dlp' 'python-pillow' 'python-numpy' 'mpv' 'ffmpeg' 'fzf')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/leoallday/mov-watch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install desktop entry
    install -Dm644 assets/movie-watch.desktop "$pkgdir/usr/share/applications/movie-watch.desktop"
    
    # Install icon
    install -Dm644 assets/movie-watch.png "$pkgdir/usr/share/pixmaps/movie-watch.png"
}
