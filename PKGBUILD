# Maintainer: Bhushan Shah <bshah@kde.org>
pkgname=plasma-workspace-units-git
pkgver=0.01
pkgrel=1
arch=("any")
pkgdesc="systemd user-session units for KDE Frameworks 5 and Plasma 5"
url="https://github.com/eliasp/plasma-workspace-units"
license=('GPL')
depends=('plasma-desktop')
conflicts=()
source=("git://github.com/eliasp/plasma-workspace-units.git#commit=8729d6")
md5sums=("SKIP") 

prepare() {
    cd plasma-workspace-units
    sed 's:\/usr\/local:\/usr:' -i systemd.desktop
}

package() {
    cd plasma-workspace-units
    install -Dm644 systemd.desktop ${pkgdir}/usr/share/xsessions/systemd.desktop
    install -Dm755 startsystemd ${pkgdir}/usr/bin/startsystemd
    install -Dm644 systemd/user/* -t ${pkgdir}/usr/lib/systemd/user/
    install -Dm644 dbus/session.d/* -t ${pkgdir}/usr/lib/dbus-1/session.d/
    install -Dm755 80-dbus ${pkgdir}/etc/X11/xinit/xinitrc.d/20-dbus
}
