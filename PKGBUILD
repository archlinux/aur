# Maintainer: Stefano Aguilera <stefano.aguilera.95@live.cl>
pkgname=monctl
pkgver=1.0
pkgrel=1
pkgdesc="Monitor Control for Gigabyte G27Q"
arch=('any')
url="https://github.com/Gothem/monctl"
license=('MIT')
depends=(python-qtpy python-pyusb)
makedepends=(python-build python-installer python-wheel python-hatchling)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('4dccb6c6b7915f2fddb3a9f28e4c3812f62f7ce43b47fa5e3e2baec4b4786337')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    echo $pkgdir
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm 644 resources/monctl.desktop "$pkgdir/usr/share/applications/monctl.desktop"
    install -Dm 644 resources/monctl.svg "$pkgdir/usr/share/pixmaps/monctl.svg"
    
    install -Dm 755 resources/monctl "$pkgdir/usr/bin/monctl"
}