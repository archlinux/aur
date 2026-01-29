# Maintainer: leoallday
pkgname=mov-watch
pkgver=1.2.1
pkgrel=1.2
pkgdesc="Terminal-based movie and TV show streaming"
arch=('any')
url="https://github.com/leoallday/mov-watch"
license=('MIT')
provides=('mov-watch')
conflicts=('mov-watch')
depends=('python' 'python-rich' 'python-requests' 'python-pypresence' 'python-cryptography' 'python-beautifulsoup4' 'yt-dlp' 'python-pillow' 'python-numpy' 'mpv' 'ffmpeg' 'fzf')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/leoallday/mov-watch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aa2febe5ff18462b20e30ac80345b4d47d7fcc77f41f303f4ed4073cf3d5f7f7')

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
