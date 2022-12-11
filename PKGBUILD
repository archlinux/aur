# Maintainer: OpenSorcerer <alex at opensourcery dot eu>
pkgname=airvpn-suite-bin
_pkgname=AirVPN-Suite
pkgver=1.2.1
_pkgver=1.2
pkgrel=1
pkgdesc="AirVPN client software collection including Bluetit, Goldcrest and Hummingbird – prebuilt stable"
arch=('x86_64' 'armv7l' 'aarch64')
url="https://gitlab.com/AirVPN/$_pkgname"
license=('GPL3')
provides=('hummingbird' 'hummingbird-bin' 'airvpn-suite' 'airvpn-suite-beta-bin')
conflicts=('hummingbird' 'hummingbird-bin' 'airvpn-suite' 'airvpn-suite-beta-bin')
depends=('dbus' 'libxml2' 'curl')
source=("https://eddie.website/repository/$_pkgname/$pkgver/$_pkgname-$arch-$pkgver.tar.gz")
sha512sums=(`curl -sLo - "https://eddie.website/repository/$_pkgname/$pkgver/$_pkgname-$arch-$pkgver.tar.gz.sha512"|cut -f1 -d " "`)
install="$pkgname.install"
changelog="Changelog-Suite.txt"

package() {
    cd $srcdir/$_pkgname

    # place binaries
    install -Dm755 bin/bluetit "$pkgdir/usr/bin/bluetit"
    install -Dm755 bin/goldcrest "$pkgdir/usr/bin/goldcrest"
    install -Dm755 bin/hummingbird "$pkgdir/usr/bin/hummingbird"

    # place documentation
    install -Dm755 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # place license
    install -Dm755 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

    # place configuration
    install -Dm600 -t "$pkgdir/etc/airvpn/" etc/airvpn/*

    # place D-Bus config
    install -Dm644 -t "$pkgdir/etc/dbus-1/system.d/" etc/dbus-1/system.d/*

    # place Systemd service
    install -Dm644 etc/systemd/system/bluetit.service "$pkgdir/usr/lib/systemd/system/bluetit.service"
}
