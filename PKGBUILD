pkgname=dwu
pkgver=1.0.0
pkgrel=1
pkgdesc="Daily Wallpaper Updater for new anime wallpapers everyday from https://wallpaper-a-day.com"
arch=('any')
url="https://github.com/starrieste/dwu"
license=('GPL-3.0-or-later')
depends=('python' 'python-click' 'python-httpx' 'python-selectolax' 'python-pillow' 'wlr-randr' 'xorg-xrandr')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('feh' 'nitrogen' 'awww-git' 'swww')
source=("$pkgname-$pkgver.tar.gz::https://github.com/starrieste/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5b537cbc2222f71caa7dbcdae7ca5c6e78834a1c5a988a03a0c5b3277ad4283f')

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
