# Maintainer: nicknb <nicknb at posteo dot com>
pkgname=soco-cli
pkgver=0.4.80
pkgrel=1
pkgdesc="Command Line Interface to Control Sonos Sound Systems"
arch=("any")
url="https://github.com/avantrec/soco-cli"
license=("Apache-2.0")
depends=("python>=3.5" "python-soco" "python-tabulate" "python-rangehttpserver"
         "python-xmltodict" "python-ifaddr" "python-fastapi" "uvicorn")
makedepends=("python-setuptools>=61.2" "python-build" "python-installer" "python-wheel")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('72a7c3d4263e13d539f52048e0c622d50becebbb5fd318dfb78d2d3fca4c7832')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
    install -Dm 0644 README.md $pkgdir/usr/share/doc/${pkgname}/README.md
}
