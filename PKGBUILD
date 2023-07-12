# Maintainer: Markus Schanz <coksnuss@googlemail.com>
pkgname=pacman-boot-backup-hook
pkgver=1.6
pkgrel=1
pkgdesc="Pacman hook that creates a copy of the /boot directory prior and post to upgrades of the systemd package or when mkinitcpio is triggered."
install=$pkgname.install
arch=('any')
backup=(etc/pacman-boot-backup.conf)
depends=(ncurses)
license=('MIT')
changelog=CHANGELOG

source=('LICENSE'
        'backup-boot-partition'
        '50_bootbackup.hook'
        'uu_bootbackup.hook'
        'pacman-boot-backup.conf')
md5sums=('ac9ac34b11dd5a53d096a734ab677479'
         'b9dcf01f081c8a2aa10b53e46b2add06'
         'a38b6feb83944ea401e871b2c2fa704d'
         '41d1095e8e4ee71e1ef6fa11a0c0180e'
         '24b9fcd221dce61036831f9a6e2b49bb')

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
