# Maintainer: Francis Gagné <fragag1@gmail.com>
pkgname=systemd-system-update-pacman
pkgver=2
pkgrel=1
pkgdesc="Scripts for scheduling and performing system updates with pacman using systemd's system update mechanism"
arch=(any)
url="https://github.com/FraGag/systemd-system-update-pacman"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FraGag/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"

    install -dm755 "$pkgdir/usr/bin"
    install -m755 schedule-system-update "$pkgdir/usr/bin"

    install -dm755 "$pkgdir/usr/lib/systemd-system-update-pacman/"
    install -m755 perform-system-update "$pkgdir/usr/lib/systemd-system-update-pacman/"

    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -m644 system-update-pacman.service "$pkgdir/usr/lib/systemd/system"

    install -dm755 "$pkgdir/usr/lib/systemd/system/system-update.target.wants"
    ln -s ../system-update-pacman.service "$pkgdir/usr/lib/systemd/system/system-update.target.wants/"

    install -dm755 "$pkgdir/usr/share/licenses/systemd-system-update-pacman"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/systemd-system-update-pacman"
}
