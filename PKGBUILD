# Maintainer: littleblack111 <littleblack11111@gmail.com>
pkgname=soft-shutdown
pkgver=1.0
pkgrel=1
pkgdesc="Gracefully shutdown userspace GUI applications before system shutdown"
arch=('any')
url="https://github.com/littleblack111/soft-shutdown"
license=('GPL3')
depends=('wmctrl' 'xorg-xprop')
source=("https://github.com/littleblack111/soft-shutdown")
sha256sums=('skip')

package() {
    install -Dm755 "$srcdir/close-userspace.sh" "$pkgdir/usr/bin/close-userspace.sh"
    install -Dm644 "$srcdir/shut-userspace.service" "$pkgdir/etc/systemd/system/shut-userspace.service"
}

post_install() {
    echo "Enabling and starting the close-userspace service for the user..."
    systemctl --user enable shut-userspace.service
    systemctl --user start shut-userspace.service
}
