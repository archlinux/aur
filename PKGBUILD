# Maintainer: OpenSourcerer <alex at opensourcery dot eu>
pkgname=airvpn-suite-bin
_pkgname=AirVPN-Suite
pkgver=1.0.0
_pkgver=1.0
pkgrel=1
pkgdesc="AirVPN client software collection including Bluetit, Goldcrest and Hummingbird – prebuilt"
arch=('x86_64' 'i686' 'armv7l' 'aarch64')
url="https://gitlab.com/AirVPN/$_pkgname"
license=('GPL3')
provides=('hummingbird-bin')
conflicts=('hummingbird-bin')
depends=('dbus' 'openssl' 'libxml2' 'xz' 'lz4')
makedepends=('curl')
source=("https://eddie.website/repository/$_pkgname/$_pkgver/$_pkgname-$arch-$pkgver.tar.gz")
sha512sums=(`curl -sLo - https://eddie.website/repository/$_pkgname/$_pkgver/$_pkgname-$arch-$pkgver.tar.gz.sha512|cut -f1 -d " "`)
install="$pkgname.install"

package() {
    cd $srcdir/$_pkgname
    
    # place binaries
    install -Dm755 bin/bluetit "$pkgdir/usr/bin/bluetit"
    install -Dm755 bin/goldcrest "$pkgdir/usr/bin/goldcrest"
    install -Dm755 bin/hummingbird "$pkgdir/usr/bin/hummingbird"

    # place configuration
    for file in etc/airvpn/*; do
        install -Dm644 "$file" "$pkgdir/etc/airvpn/"
    done

    # place D-Bus config
    install -Dm644 etc/dbus-1/system.d/org.airvpn.client.conf "$pkgdir/etc/dbus-1/system.d/org.airvpn.client.conf"
    install -Dm644 etc/dbus-1/system.d/org.airvpn.server.conf "$pkgdir/etc/dbus-1/system.d/org.airvpn.server.conf"

    # place Systemd service
    install -Dm644 etc/systemd/system/bluetit.service "$pkgdir/etc/systemd/system/bluetit.service"
}
