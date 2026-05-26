# Maintainer: IRRatium <https://github.com/IRRatium>
pkgname=badapple
pkgver=2.1.0
pkgrel=1
pkgdesc="Bad Apple!! ASCII art player for the terminal (real-time rendering)"
arch=('any')
url="https://github.com/IRRatium/badapple-aur"
license=('MIT')

depends=('python' 'python-pillow' 'mpv' 'ffmpeg' 'ascii-image-converter')

source=("badapple-$pkgver.tar.gz::https://github.com/IRRatium/badapple-aur/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

_VIDEO_URL="https://github.com/trung-kieen/bad-apple-ascii/raw/refs/heads/main/bad_apple.mp4"

build() {
    local work="$srcdir/_badapple_build"
    mkdir -p "$work"

    echo "==> Downloading video..."
    curl -L --progress-bar "$_VIDEO_URL" -o "$work/bad_apple.mp4"
}

package() {
    cd "$srcdir/badapple-aur-$pkgver"
    local work="$srcdir/_badapple_build"

    install -Dm755 badapple "$pkgdir/usr/bin/badapple"
    install -Dm644 "$work/bad_apple.mp4" \
        "$pkgdir/usr/share/badapple/bad_apple.mp4"
}
