# Maintainer: Nicolai <Finic8@protonmail.com>
pkgname=zbectl-git
pkgver=v0.2.r6.ge272cd8
pkgrel=1
pkgdesc="script for managing boot environments using zfs"
arch=(any)
url="https://github.com/Finic8/zbectl"
license=('GPL')
depends=('zfs' 'bash')
makedepends=('git')
provides=('zbectl')
source=($pkgname::git+https://github.com/Finic8/zbectl)
md5sums=('SKIP')
pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
	cd "$pkgname"
	install -D -m 755 zbectl "$pkgdir/usr/bin/zbectl"
	install -D -m 644 99-zbectl-upgrade.hook "$pkgdir/usr/share/libalpm/hooks/99-zbectl-upgrade.hook"
	install -D -m 644 99-zbectl-remove.hook "$pkgdir/usr/share/libalpm/hooks/99-zbectl-remove.hook"
	install -D -m 644 10-zbectl-pre.hook "$pkgdir/usr/share/libalpm/hooks/10-zbectl-pre.hook"
	install -D -m 644 zbectl.8 "$pkgdir/usr/share/man/man8/zbectl.8"
}
