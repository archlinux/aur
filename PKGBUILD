# Maintainer: Dennis Stengele <d.stengele (at) derintendant (dot) de>
pkgname=tuptime
pkgver=5.1.0
pkgrel=1
pkgdesc="Report the historical and statistical running time of system"
arch=('any')
url="https://github.com/rfrail3/tuptime"
license=('GPL')
depends=(
          'python'
        )
install=tuptime.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/rfrail3/tuptime/archive/${pkgver}.tar.gz")
sha256sums=('8aa5adddba6ee8e1c70819b45de49637e20083bac92b608590bd71d2b7f7973c')

package() {
    cd "$srcdir/$pkgname-${pkgver}"

    install -D -m755 "src/tuptime" "$pkgdir/usr/bin/tuptime"
    install -D -m644 "src/systemd/tuptime.service" "$pkgdir/usr/lib/systemd/system/tuptime.service"
    install -D -m644 "src/systemd/tuptime-cron.service" "$pkgdir/usr/lib/systemd/system/tuptime-cron.service"
    install -D -m644 "src/systemd/tuptime-cron.timer" "$pkgdir/usr/lib/systemd/system/tuptime-cron.timer"
    install -d -m755 "$pkgdir/usr/lib/systemd/system/timers.target.wants"
    install -d -m755 "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"

    ln -s "$pkgdir/usr/lib/systemd/system/tuptime.service" "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/tuptime.service"
    ln -s "$pkgdir/usr/lib/systemd/system/tuptime-cron.timer" "$pkgdir/usr/lib/systemd/system/timers.target.wants/tuptime-cron.timer"
}
