# Maintainer: Shifat <hakim.shifat@gmail.com>
# Contributor: Abdul Hakim Shifat

pkgname=ytui_music
pkgver=0.1.1
pkgrel=1
pkgdesc="A terminal-based YouTube audio player built with Textual and mpv"
arch=('any')
url="https://github.com/hakimshifat/ytui_music"
license=('GPL-3.0-or-later')

# Dependencies: 
# - official repositories: python, mpv, python-textual, python-mpv, yt-dlp, python-requests, python-pillow
# - AUR repositories: python-textual-image
depends=(
    'python'
    'mpv'
    'python-textual'
    'python-mpv'
    'yt-dlp'
    'python-requests'
    'python-pillow'
    'python-textual-image'
)

makedepends=(
    'python-build'
    'python-pip'
    'python-setuptools'
    'python-installer'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/hakimshifat/ytui_music/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1556912780b1febc8f941a11ebc02ef005e52e1e868f92a1481d0b4cf951f710')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install the built wheel to $pkgdir
    # --no-deps ensures we use the system dependencies listed above
    python -m installer --destdir="$pkgdir" dist/*.whl
}
