# Maintainer: littleblack111 <littleblack11111@gmail.com>
pkgname=soft-shutdown
pkgver=r2.49fa83c
pkgrel=1
pkgdesc="Gracefully shutdown userspace GUI applications before system shutdown"
arch=('any')
url="https://github.com/littleblack111/soft-shutdown"
license=('GPL-3.0-or-later')
depends=('wmctrl' 'xorg-xprop')
makedepends=('git')
source=("git+https://github.com/littleblack111/soft-shutdown")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm755 close-userspace.sh "$pkgdir/usr/bin/close-userspace.sh"
    install -Dm644 shut-userspace.service "$pkgdir/etc/systemd/system/shut-userspace.service"
}

post_install() {
    echo "Enabling and starting the close-userspace service for the user..."
    systemctl --user enable --now shut-userspace.service
}
