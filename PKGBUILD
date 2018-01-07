# Maintainer: Markus Schanz <coksnuss@googlemail.com>
pkgname=pacman-boot-backup-hook
pkgver=1.2
pkgrel=1
pkgdesc="Pacman hook that uses rsync to backup the /boot directory prior and post to upgrades of the linux or systemd package."
arch=('any')
license=('custom:MIT')
changelog=CHANGELOG
depends=('rsync')

source=('LICENSE'
        'backup-boot-partition'
        'bootbackup.post.hook'
        'bootbackup.pre.hook'
	'pacman-boot-backup.conf')
md5sums=('ac9ac34b11dd5a53d096a734ab677479'
         '3cd8131ceb4563164ab12cc7b7d61ed6'
         '688911051c14693e4a65e043ecb5bde4'
         '05868b278d10a4d5b1493d8b33d34139'
         'c5d37420cddc494cba64930ea54518b1')

package() {
	install -m 0755 -d $pkgdir/usr/share/licenses/$pkgname
	install -m 0644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname

	install -m 0755 -d $pkgdir/etc
	install -m 0644 $srcdir/pacman-boot-backup.conf $pkgdir/etc

	install -m 0755 -d $pkgdir/usr/share/libalpm/hooks
	install -m 0644 $srcdir/bootbackup.post.hook $pkgdir/usr/share/libalpm/hooks
	install -m 0644 $srcdir/bootbackup.pre.hook $pkgdir/usr/share/libalpm/hooks

	install -m 0755 -d $pkgdir/usr/share/libalpm/scripts
	install -m 0755 $srcdir/backup-boot-partition $pkgdir/usr/share/libalpm/scripts
}
