# Maintainer: Shifat <hakim.shifat@gmail.com>
# Contributor: Abdul Hakim Shifat

pkgname=ytui_music
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal-based YouTube audio player built with Textual and mpv"
arch=('any')
url="https://github.com/hakimshifat/ytui_music"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'mpv'
    'python-textual'
    'python-textual-image'
    'yt-dlp'
    'python-requests'
    'python-pillow'
)
makedepends=(
    'python-build'
    'python-pip'
    'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/hakimshifat/ytui_music/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d4cf4e9bc30634bf8d8b728b502af1a4c438b3440c0fcfc5fee1ede5305f8948')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install ONLY the package itself, NOT its dependencies (handled by pacman)
    # Use --force-reinstall to ensure installation in fakeroot
    pip install --root="$pkgdir" --prefix=/usr --no-deps --no-build-isolation \
        --ignore-installed dist/*.whl
}
