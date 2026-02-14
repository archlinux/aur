pkgname=goonget
pkgver=0.3.1
pkgrel=1
pkgdesc="CLI tool to fetch images/gifs/videos from rule34 and display them directly in terminal"
arch=('any')
url="https://github.com/LewdM3at/GoonGet"
license=('MIT')
depends=('python' 'python-requests' 'chafa')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('792077886e237ba9319521270f3f1ca037d509bb2977d3a05b923b7e1b1d351f')

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
