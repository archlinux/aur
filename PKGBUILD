# Maintainer: minus <minus@mnus.de>
# Contributor: Thorsten Tasch
# Contributor: Jordi Cerdan <jcerdan@tecob.com>

pkgname=backup-manager
pkgver=0.7.15
pkgrel=1
pkgdesc="An easy-to-use backup solution for making archives"
url="https://github.com/sukria/Backup-Manager"
license=("GPL2")
depends=('perl')
optdepends=('gnupg: backup encryption')
arch=('i686' 'x86_64')
backup=('etc/backup-manager.conf')
source=("https://github.com/sukria/Backup-Manager/archive/$pkgver.tar.gz")
sha512sums=('13e50e5e12de0b9397d26e8a20f260fe7974838cc8e4d61d7b7bbf3f888418b6f1cf254a4bfd4a87679d6c8d0f9f14533275acd975cf9dd6a9b29155d01dcd97')

package() {
	cd "$srcdir/Backup-Manager-$pkgver"
	make PREFIX=/usr BINDIR=/usr/bin SBINDIR=/usr/bin VARDIR=/var DESTDIR="$pkgdir" install || return 1
	mkdir -p "$pkgdir/etc"
	mv "$pkgdir/usr/share/backup-manager/backup-manager.conf.tpl" "$pkgdir/etc/backup-manager.conf"
	rmdir "$pkgdir/usr/share/backup-manager"
}
