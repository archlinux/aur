# Maintainer: leoallday
#
# pkgver, pkgrel and sha256sums are filled in by .github/workflows/aur-publish.yml
# on every stable GitHub release. Edit dependencies and packaging here, then cut
# a release - do not bump the version by hand.
pkgname=mov-watch
pkgver=2.3.3
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
sha256sums=('c9100caba166bbbf974438b8f75e015bf29b7add7d55d90736b96cd71272c3ee')

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
