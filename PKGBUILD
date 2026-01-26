# Maintainer: leoallday
pkgname=mov-watch
pkgver=1
pkgrel=1
pkgdesc="Terminal-based movie and TV show streaming"
arch=('any')
url="https://github.com/leoallday/mov-watch"
license=('GPL3')
provides=('mov-watch')
conflicts=('mov-watch')
depends=('python' 'python-rich' 'python-requests' 'python-pypresence' 'python-cryptography' 'yt-dlp' 'python-pillow' 'python-numpy' 'mpv' 'fzf')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/leoallday/mov-watch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('89b88e71e3fafa16f3e080bb4241a4be7a23b6a5c642e2f1c898acd7ff16f84a')

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
