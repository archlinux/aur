# Maintainer: Shifat <hakim.shifat@gmail.com>
# Contributor: Abdul Hakim Shifat

pkgname=ytui_music
pkgver=0.1.1
pkgrel=1
pkgdesc="A terminal-based YouTube audio player built with Textual and mpv"
arch=('any')
url="https://github.com/hakimshifat/ytui_music"
license=('GPL-3.0-or-later')

# All dependencies from official repos (no AUR dependencies)
depends=(
    'python'
    'mpv'
    'python-textual'
    'python-textual-image'
    'python-mpv'
    'yt-dlp'
    'python-requests'
    'python-pillow'
)

makedepends=(
    'python-build'
    'python-pip'
    'python-setuptools'
    'python-installer'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/hakimshifat/ytui_music/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP') # Update this after tagging release v0.1.1

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install wheel - dependencies are handled by pacman
    python -m installer --destdir="$pkgdir" dist/*.whl
}
