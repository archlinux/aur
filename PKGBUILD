pkgname=goonget
pkgver=0.4.0
pkgrel=1
pkgdesc="CLI tool to fetch images/gifs/videos from rule34 and display them directly in terminal"
arch=('any')
url="https://github.com/LewdM3at/GoonGet"
license=('MIT')
depends=('python' 'python-requests' 'chafa')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4e40d25233efadeede34e17f4cc45311ee62c95bae23ef6a3cb025d216d83be0')

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
