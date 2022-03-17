# Maintainer: OpenSorcerer <alex at opensourcery dot eu>
pkgname=airvpn-suite-beta-bin
_pkgname=AirVPN-Suite
pkgver=1.2.0
_prstage=RC
_prver=3
pkgrel=4
pkgdesc="AirVPN client software collection including Bluetit, Goldcrest and Hummingbird – prebuilt beta"
arch=('x86_64' 'armv7l' 'aarch64')
url="https://gitlab.com/AirVPN/$_pkgname"
license=('GPL3')
provides=('hummingbird' 'hummingbird-bin' 'airvpn-suite' 'airvpn-suite-bin')
conflicts=('hummingbird' 'hummingbird-bin' 'airvpn-suite' 'airvpn-suite-bin')
depends=('dbus' 'libxml2')
source=("https://eddie.website/repository/$_pkgname/$pkgver-$_prstage$_prver/$_pkgname-$arch-$pkgver-$_prstage-$_prver.tar.gz")
sha256sums=('f6c74705e137dd13dabfaf9fe57533aa1f0955ad22e6d92251edb623f2ca6c46')
sha256sums_armv7l=('e4040cc14c0c99e648832f87954674e69d1ba8ccce3959b63c74fe54083b7fbf')
sha256sums_aarch64=('b0e069e84ff277a4c11df87b5c1df2d2a24068478090bc840a4d12665063ebef')
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
