# Maintainer: Nils Schulte <git@nilsschulte.de>
pkgname=server-report-git
pkgver=r1.df4a9bb752
pkgrel=1
pkgdesc="Weekly btrfs health check and email report via msmtp"
arch=('any')
url="https://codeberg.org/schnils/server-report"
license=('MIT')
depends=('btrfs-progs' 'msmtp')
makedepends=('git')
provides=('server-report')
conflicts=('server-report')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    install -Dm755 server-report.sh "$pkgdir/usr/bin/server-report.sh"
    install -Dm644 "server-report@.service" "$pkgdir/usr/lib/systemd/system/server-report@.service"
    install -Dm644 "server-report@.timer" "$pkgdir/usr/lib/systemd/system/server-report@.timer"
}
