# Maintainer: Markus Schanz <coksnuss@googlemail.com>
pkgname=pacman-boot-backup-hook
pkgver=1.1
pkgrel=1
pkgdesc="Pacman hook that uses rsync to backup the /boot directory prior to upgrades of the linux or systemd package."
arch=('any')
license=('custom:MIT')
changelog=CHANGELOG
depends=('rsync')

source=('LICENSE'
        '50_bootbackup.hook'
	'pacman-boot-backup.conf'
	'pre-kernel-upgrade-rsync')
md5sums=('ac9ac34b11dd5a53d096a734ab677479'
         'f731f5aee99eecc75d6c0686742d3a23'
         '27819f1384ade1a543a1c110bf9fc846'
         '0fdff0b79eb987701a2c54c40910fed0')

package() {
	install -m 0755 -d $pkgdir/usr/share/licenses/$pkgname
	install -m 0644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname

	install -m 0755 -d $pkgdir/etc
	install -m 0644 $srcdir/pacman-boot-backup.conf $pkgdir/etc

	install -m 0755 -d $pkgdir/usr/share/libalpm/hooks
	install -m 0644 $srcdir/50_bootbackup.hook $pkgdir/usr/share/libalpm/hooks

	install -m 0755 -d $pkgdir/usr/share/libalpm/scripts
	install -m 0755 $srcdir/pre-kernel-upgrade-rsync $pkgdir/usr/share/libalpm/scripts
}
