pkgname=goonget
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI tool to fetch images/gifs/videos from Gelbooru and display them directly in terminal"
arch=('any')
url="https://github.com/LewdM3at/GoonGet"
license=('MIT')
depends=('python' 'python-requests' 'chafa')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a40b35bed01ffc891183ec642f6159401dd71d08fac2a76344c30b405672fd62')

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
