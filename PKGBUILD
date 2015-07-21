# Maintainer: Silvio Knizek <killermoehre@gmx.net>
pkgname=reflector-timer
pkgver=3
pkgrel=2
pkgdesc='A service and timer for the reflector mirrorlist upgrade.'
arch=('any')
url='http://xyne.archlinux.ca/projects/reflector/'
license=('GPL')
depends=('reflector' 'systemd')
backup=('etc/conf.d/reflector.conf')
source=('reflector.service'
        'reflector.timer'
        'reflector.conf')
md5sums=('41d8e59e224200a41c256ca465454c29'
         '45f7496d7b0282f1f3ee5d5cb99c9cbb'
         '621329d2064b2919b1fd0aaade0cc122')

package() {
    install -D -m 644 'reflector.service' "$pkgdir/usr/lib/systemd/system/reflector.service"
    install -D -m 644 'reflector.timer' "$pkgdir/usr/lib/systemd/system/reflector.timer"
    install -D -m 644 'reflector.conf' "$pkgdir/etc/conf.d/reflector.conf"
    install -d -m 755 "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants"
    ln -s "../reflector.timer" "${pkdir}/usr/lib/systemd/system/multi-user.target.wants/reflector.timer"
}
