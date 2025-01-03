# Maintainer: kirik
pkgname=varchiver
pkgver=0.2.4
pkgrel=1
pkgdesc="Advanced Archive Management Tool with modern UI"
arch=('any')
url="https://github.com/instancer-kirik/varchiver"
license=('custom:proprietary')
depends=(
    'python'
    'python-pyqt6'
    # 'python-poetry'
    'python-psutil'
    'p7zip'
    'rar'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e57d680c9bf394be4487d7ae5312593a690b3c78470f3f0f925e614aa48b4e0c')

build() {
    cd "$pkgname-$pkgver"
    uv config virtualenvs.create false
    uv install --no-dev
}

package() {
    cd "$pkgname-$pkgver"
    uv build
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
# Updated on Fri Jan  3 03:39:14 PM EST 2025
