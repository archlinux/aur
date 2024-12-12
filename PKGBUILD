# Maintainer: kirik
pkgname=varchiver
pkgver=0.1.0
pkgrel=1
pkgdesc="Advanced Archive Management Tool with modern UI"
arch=('any')
url="https://github.com/instancer-kirik/varchiver"
license=('custom:proprietary')
depends=(
    'python'
    'python-pyqt6'
    'python-poetry'
    'p7zip'
    'unrar'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    poetry build
}

package() {
    cd "$pkgname-$pkgver"
    
    # Install Python package
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install desktop file
    install -Dm644 "varchiver.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install icon
    install -Dm644 "varchiver.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

    # Install license
    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
