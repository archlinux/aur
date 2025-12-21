pkgname=dwu
pkgver=0.1.0
pkgrel=1
pkgdesc="Daily Wallpaper Updater for a new anime wallpaper from wallpaper-a-day.com"
arch=('any')
url="https://github.com/starrieste/dwu"
license=('GPL-3.0-or-later')
depends=('python' 'python-click' 'python-httpx' 'python-selectolax')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/starrieste/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b58b1ce14a22d5ffbc62d26d180c620e704c21266d7f7135a85a4de5090806ba')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    install -Dm644 systemd/dwu.service "$pkgdir/usr/lib/systemd/user/dwu.service"
    install -Dm644 systemd/dwu.timer "$pkgdir/usr/lib/systemd/user/dwu.timer"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
