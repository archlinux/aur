# Maintainer: leoallday
#
# pkgver, pkgrel and sha256sums are filled in by .github/workflows/aur-publish.yml
# on every stable GitHub release. Edit dependencies and packaging here, then cut
# a release - do not bump the version by hand.
pkgname=mov-watch
pkgver=2.3.2
pkgrel=1
pkgdesc="Terminal-based movie and TV show streaming"
arch=('any')
url="https://github.com/leoallday/mov-watch"
license=('GPL3')
provides=('mov-watch')
conflicts=('mov-watch')
depends=('python' 'python-rich' 'python-requests' 'python-pypresence' 'python-playwright' 'yt-dlp' 'python-pillow' 'python-numpy' 'mpv' 'ffmpeg' 'fzf')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/leoallday/mov-watch/archive/refs/tags/v${pkgver}.tar.gz")
# Replace SKIP with the real checksum before submitting to the AUR:
#   updpkgsums
sha256sums=('5aac07f4a5f475b61170f5d2f9f2c4be7d7d9028aadecf02e641bec5d39ed3f7')

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
