# Maintainer: Ben <your-email@example.com>
pkgname=squid-music-git
pkgver=r6.b6aa0ff
pkgrel=1
pkgdesc="A CMUS-inspired terminal frontend for YouTube Music"
arch=('any')
url="https://github.com/WritingBen/squid"
license=('MIT')
depends=(
    'python>=3.11'
    'python-textual'
    'python-pydantic'
    'python-httpx'
    'python-aiosqlite'
    'python-platformdirs'
    'python-structlog'
    'python-ytmusicapi'  # AUR
    'python-mpv'         # AUR
    'yt-dlp'
    'deno'
    'mpv'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'git'
)
provides=('squid-music')
conflicts=('squid-music')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
