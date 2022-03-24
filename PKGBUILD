# Maintainer: OpenSorcerer <alex at opensourcery dot eu>
pkgname=airvpn-suite-beta-bin
_pkgname=AirVPN-Suite
pkgver=1.2.0
_pkgver=1.2
#_prstage=RC
#_prver=3
pkgrel=5
pkgdesc="AirVPN client software collection including Bluetit, Goldcrest and Hummingbird – prebuilt beta"
arch=('x86_64' 'armv7l' 'aarch64')
url="https://gitlab.com/AirVPN/$_pkgname"
license=('GPL3')
provides=('hummingbird' 'hummingbird-bin' 'airvpn-suite' 'airvpn-suite-bin')
conflicts=('hummingbird' 'hummingbird-bin' 'airvpn-suite' 'airvpn-suite-bin')
depends=('dbus' 'libxml2')
source=("https://eddie.website/repository/$_pkgname/$_pkgver/$_pkgname-$arch-$pkgver.tar.gz")
sha512sums=('4ef9e3ed5cba50a9b994df35b11485b0c73f19b9052de127ddb4cc6e54198aee526329e74b2aa2e690d84d2850f1f154bffbfc7d12c1453c7d153f9d8078e788')
sha512sums_armv7l=('4cc2dd9c312f594f5828fa6821f9af8d2b2a857d6743a9ef6bbe011232ce2c204a40c7f8bc7367a9091e8c349f31dd9bd57cf5dc2f1c4eaac6a8710266358b05')
sha512sums_aarch64=('4490a846bf3b3bb41722392ad00097fe9f04eafc7e1b6a35bdc506af5647df741c63336895a9dc13f5a99f661472896b1862696bdd4fa6dd864c621599914100')
backup=('etc/airvpn/bluetit.rc')
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
