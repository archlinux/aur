# Maintainer: bill88t <bill88t@feline.gr>

pkgname=voxdroid-kemono
pkgver=5.4.0.r7.gc97e6fb
pkgrel=1
pkgdesc="VoxDroid's Kemono Downloader - A cross-platform Python app built with PyQt6 to download posts and creator content from Kemono.su"
arch=('any')
url="https://github.com/VoxDroid/KemonoDownloader"
license=('MIT')
depends=(
    'python'
    'python-aiohttp'
    'python-fake-useragent'
    'python-pillow'
    'python-requests'
    'python-qtawesome'
    'python-beautifulsoup4'
    'python-pyqt6'
)

makedepends=('git')
source=("git+https://github.com/VoxDroid/KemonoDownloader.git"
        "launcher.sh")
sha256sums=('SKIP'
            '3f008b0e8e3f0049c1595f12bff5db07fc845eb2da8eadf4e34521ac4c187488')

pkgver() {
    cd "KemonoDownloader"
    git describe --tags --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo "1.0.0"
}

build() {
    cd "KemonoDownloader"
    python -m compileall .
}

package() {
    cd "KemonoDownloader"

    python -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
    install -Dm755 "$srcdir/launcher.sh" "$pkgdir/usr/bin/kemono"
}
