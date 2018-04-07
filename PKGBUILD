# Maintainer: Markus Schanz <coksnuss@googlemail.com>
pkgname=pacman-boot-backup-hook
pkgver=1.3
pkgrel=2
pkgdesc="Pacman hook that uses rsync to backup the /boot directory prior and post to upgrades of the linux or systemd package."
arch=('any')
license=('MIT')
changelog=CHANGELOG
depends=('rsync')

source=('LICENSE'
        'backup-boot-partition'
        '50_bootbackup.hook'
        'uu_bootbackup.hook'
	'pacman-boot-backup.conf')
md5sums=('ac9ac34b11dd5a53d096a734ab677479'
         '3cd8131ceb4563164ab12cc7b7d61ed6'
         'c5cca1a979e913f87e859436919c016c'
         'f041fe352b3f48f08a1afad132312b94'
         'c5d37420cddc494cba64930ea54518b1')

package() {
	install -m 0755 -d $pkgdir/usr/share/licenses/$pkgname
	install -m 0644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname

	install -m 0755 -d $pkgdir/etc
	install -m 0644 $srcdir/pacman-boot-backup.conf $pkgdir/etc

	install -m 0755 -d $pkgdir/usr/share/libalpm/hooks
	install -m 0644 $srcdir/50_bootbackup.hook $pkgdir/usr/share/libalpm/hooks
	install -m 0644 $srcdir/uu_bootbackup.hook $pkgdir/usr/share/libalpm/hooks

	install -m 0755 -d $pkgdir/usr/share/libalpm/scripts
	install -m 0755 $srcdir/backup-boot-partition $pkgdir/usr/share/libalpm/scripts
}
