# Maintainer: MojArch <your.email@example.com>
pkgname=fnlock
pkgver=1.0
pkgrel=1
pkgdesc="A systemd service to toggle Fn Lock using Ctrl, Shift, and Alt keys For Lenovo laptops"
arch=('any')
url="https://github.com/yourrepo/FnLock"
license=('GPL3')
depends=('python-evdev')
optdepends=()
source=("FnLock.sh" "FnLock.service")
sha256sums=('5cf5b75fd57797480ec876f4b51ccc42e420d79671f02c2c290e442e80057b82' 'dd3fcefe0b125a0e4a1f4f310029188a985eb1c4e4e6ac689671ec3552370c81')

package() {
    # Install script
    install -Dm755 "$srcdir/FnLock.sh" "$pkgdir/usr/bin/FnLock"

    # Install systemd service
    install -Dm644 "$srcdir/FnLock.service" "$pkgdir/usr/lib/systemd/system/FnLock.service"

    # Enable service on installation
    install -Dm755 /dev/null "$pkgdir/usr/lib/systemd/system-preset/99-FnLock.preset"
    echo "enable FnLock.service" > "$pkgdir/usr/lib/systemd/system-preset/99-FnLock.preset"
}

