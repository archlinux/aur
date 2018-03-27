# Maintainer:  Alex Mekkering <amekkering at gmail dot com>

pkgname=luky-borg-backup

pkgver=1.0.3
pkgrel=2
pkgdesc="Automated backup scripts using Borg Backup, systemd and optionally Nextcloud/ownCloud/Stack"
arch=(any)
license=("MIT")
url="https://github.com/AlexMekkering/luky-borg-backup"
depends=("borg")
optdepends=("owncloud-client: For backing up to Nextcloud/ownCloud/Stack"
            "systemd-unit-status-mail: For mailing the backup unit's status"
            "sudo: For sending notifications to users"
            "libnotify: For sending notifications to users")
source=("https://github.com/AlexMekkering/luky-borg-backup/archive/v${pkgver}.tar.gz")
backup=("etc/luky-borg-backup.conf")
sha256sums=('efda174c8e4832d6b2af7cea0534094a322848d35f2ababf6883ac3fbd851e99')

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    install -D -m 755 "luky-borg-backup" "$pkgdir/usr/bin/luky-borg-backup"
    install -D -m 644 "luky-borg-backup.service" "$pkgdir/usr/lib/systemd/system/luky-borg-backup.service"
    install -D -m 644 "luky-borg-backup.timer" "$pkgdir/usr/lib/systemd/system/luky-borg-backup.timer"
    install -D -m 600 "luky-borg-backup.conf" "$pkgdir/etc/luky-borg-backup.conf"
}
