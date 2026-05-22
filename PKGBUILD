# Maintainer: Davi Alves Sampaio <davialvessampaio00@gmail.com>
pkgname=simple-battery-notify
pkgver=1.0.1
pkgrel=1
pkgdesc="A customizable, D-Bus driven battery notification daemon and CLI"
arch=('any')
url="https://github.com/Davi-S/simple-battery-notify"
license=('GPL3')
depends=('python' 'python-gobject' 'python-pydbus' 'libnotify' 'upower')

source=("$pkgname-$pkgver.tar.gz::https://github.com/Davi-S/simple-battery-notify/archive/refs/tags/${pkgver}.tar.gz")

# Remember to run updpkgsums or makepkg -g to replace this SKIP!
sha256sums=('da0c7b204f6866148145c96730d3db2922444ff6ed8ac9bfb550977f39e17bfb')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install the main Python executable (renaming it without the .py extension)
    install -Dm755 "battery-notify.py" "$pkgdir/usr/bin/battery-notify"
    
    # Install the default configuration (renaming config.json to battery-notify.json)
    install -Dm644 "config.json" "$pkgdir/etc/battery-notify.json"
    
    # Install the systemd user service
    install -Dm644 "battery-notify.service" "$pkgdir/usr/lib/systemd/user/battery-notify.service"
}
