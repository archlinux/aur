pkgname=dwu
pkgver=1.2.4
pkgrel=1
pkgdesc="Daily Wallpaper Updater for new anime wallpapers everyday from https://wallpaper-a-day.com"
arch=('any')
url="https://github.com/starrieste/dwu"
license=('GPL-3.0-or-later')
depends=('python' 'python-click' 'python-httpx' 'python-selectolax' 'python-pillow' 'python-platformdirs' 'python-tomli-w' 'wlr-randr' 'xorg-xrandr')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('awww-git' 'swww' 'feh' 'nitrogen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/starrieste/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('77148ae656b6d75bb7aa3f8838acd049ae21c99507a0e8c6e1fabe25fed28102')

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
