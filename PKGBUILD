# Maintainer: OpenSorcerer <alex at opensourcery dot eu>
pkgname=airvpn-suite-beta-bin
_pkgname=AirVPN-Suite
pkgver=1.2.0
_prstage=RC
_prver=1
pkgrel=2
pkgdesc="AirVPN client software collection including Bluetit, Goldcrest and Hummingbird – prebuilt beta"
arch=('x86_64' 'armv7l' 'aarch64')
url="https://gitlab.com/AirVPN/$_pkgname"
license=('GPL3')
provides=('hummingbird' 'hummingbird-bin' 'airvpn-suite' 'airvpn-suite-bin')
conflicts=('hummingbird' 'hummingbird-bin' 'airvpn-suite' 'airvpn-suite-bin')
depends=('dbus' 'openssl' 'libxml2' 'xz' 'lz4')
source=("https://eddie.website/repository/$_pkgname/$pkgver-$_prstage$_prver/$_pkgname-$arch-$pkgver-$_prstage-$_prver.tar.gz")
sha256sums=('f6444a3d20b182503e3b24fedf41a6e1d2aff9f740569eb40d25990751125162')
sha256sums_armv7l=('9abf722925888ce326a6869d6005985d4d5a8f95bd6037f78550f822855d40b7')
sha256sums_aarch64=('f0740d1db80917dee45924d9e263acd038111311b67cf8a53c7672f080f931ed')
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
