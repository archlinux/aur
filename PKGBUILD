# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: Fabio Di Giorgio <ravnos at duck dot com>
pkgname=fake-systemd-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='systemctl and journalctl compatibility layer for systems without systemd (prebuilt static binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/0cool-f/fake-systemd'
license=('GPL-3.0-or-later')
provides=('fake-systemd' 'systemctl')
conflicts=('fake-systemd' 'systemd')
options=('!strip' '!debug')
source_x86_64=("https://github.com/0cool-f/fake-systemd/releases/download/v0.1.0/fake-systemd-$pkgver-x86_64-linux-musl.tar.gz")
source_aarch64=("https://github.com/0cool-f/fake-systemd/releases/download/v0.1.0/fake-systemd-$pkgver-aarch64-linux-musl.tar.gz")
sha256sums_x86_64=('500edd067471b2d6229e0b3459d52ef7145da3212721cacbf8f2c60fcb3715ac')
sha256sums_aarch64=('e971a697d1d517d988e96d1b061192b6c1468a809f627b809c930336f96c0711')

package() {
    case $CARCH in
        x86_64) _target=x86_64-linux-musl ;;
        aarch64) _target=aarch64-linux-musl ;;
    esac
    cd "fake-systemd-$pkgver-$_target"
    install -Dm755 fake-systemd -t "$pkgdir/usr/bin"
    ln -s fake-systemd "$pkgdir/usr/bin/systemctl"
    ln -s fake-systemd "$pkgdir/usr/bin/journalctl"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
