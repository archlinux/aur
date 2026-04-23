pkgname=goonget
pkgver=1.2.0
pkgrel=1
pkgdesc="CLI tool to fetch images/gifs/videos from rule34 or gelbooru and display them directly in terminal"
arch=('any')
url="https://github.com/LewdM3at/GoonGet"
license=('MIT')
depends=('python' 'python-requests' 'chafa' 'mpv')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac50b670fc03b633d9d265be7b886040be2f001d6b65ac7cd779590ec0ebdbd1')

build() {
    cd "$srcdir/GoonGet-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/GoonGet-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install wrapper scripts
    install -Dm755 scripts/goonget "$pkgdir/usr/bin/goonget"
    install -Dm755 scripts/gg "$pkgdir/usr/bin/gg"
}
