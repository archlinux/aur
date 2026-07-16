# Maintainer: wleeaf <https://github.com/wleeaf>
pkgname=projectum
pkgver=2.4.0
pkgrel=1
pkgdesc="Keyboard-first desktop tracker for the projects, playlists, tasks and notes in a folder"
arch=('any')
url="https://github.com/wleeaf/projectum"
license=('MIT')
depends=('python' 'pyside6' 'yt-dlp' 'hicolor-icon-theme')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1554e5b4369cca7c10e47f9b7b7cd662647f1dda06d7fbd2c76f9f3c5d411788')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 packaging/appimage/projectum.desktop \
        "$pkgdir/usr/share/applications/projectum.desktop"
    install -Dm644 projectum/assets/icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/projectum.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
