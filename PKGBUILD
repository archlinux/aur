pkgname=dwu
pkgver=1.2.8
pkgrel=1
pkgdesc="Daily Wallpaper Updater for new anime wallpapers everyday from https://wallpaper-a-day.com"
arch=('any')
url="https://github.com/starrieste/dwu"
license=('GPL-3.0-or-later')
depends=('python' 'python-click' 'python-httpx' 'python-selectolax' 'python-pillow' 'python-platformdirs' 'python-tomli-w' 'wlr-randr' 'xorg-xrandr')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('awww-git' 'swww' 'feh' 'nitrogen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/starrieste/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5665904bb0db17e1bd99e485d50699664e6e1a91f227eac0fb02a8a1efc1f49d')

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
