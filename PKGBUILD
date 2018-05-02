# Maintainer: minus <minus@mnus.de>
# Contributor: Thorsten Tasch
# Contributor: Jordi Cerdan <jcerdan@tecob.com>
pkgname=backup-manager
pkgver=0.7.14
pkgrel=1
pkgdesc="An easy-to-use backup solution for making archives"
url="http://www.backup-manager.org/"
license=("GPL")
depends=('perl')
optdepends=(
	'gnupg: backup encryption'
)
arch=('i686' 'x86_64')
makedepends=()
conflicts=()
replaces=()
backup=('etc/backup-manager.conf')
source=("https://github.com/sukria/Backup-Manager/archive/$pkgver.tar.gz")
sha256sums=('ff098edc982fad2db6d22c575d93d5ea0180b61701971fd861779d7489844134')

package() {
	cd "$srcdir/Backup-Manager-$pkgver"
	make PREFIX=/usr BINDIR=/usr/bin SBINDIR=/usr/bin VARDIR=/var DESTDIR="$pkgdir" install || return 1
	mkdir -p "$pkgdir/etc"
	mv "$pkgdir/usr/share/backup-manager/backup-manager.conf.tpl" "$pkgdir/etc/backup-manager.conf"
	rmdir "$pkgdir/usr/share/backup-manager"
}
