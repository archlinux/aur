# Maintainer: Raflos <raflos@gmx.com>
pkgname=untitled-video-player-git
pkgver=r39.c52bc0a
pkgrel=1
pkgdesc="A video player desktop application (git version)"
arch=('x86_64')
url="https://github.com/raflos10/video-player"
license=('GPL3')
depends=('python' 'pyside6')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('video-player')
conflicts=('video-player')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/video-player"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/video-player"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/video-player"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 video-player.desktop "$pkgdir/usr/share/applications/untitled-video-player.desktop"
    install -Dm644 assets/icon.svg "$pkgdir/usr/share/pixmaps/untitled-video-player.svg"
}
