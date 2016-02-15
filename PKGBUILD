# Maintainer: minus <minus@mnus.de>
# Contributor: Thorsten Tasch
# Contributor: Jordi Cerdan <jcerdan@tecob.com>
pkgname=backup-manager
pkgver=0.7.10
pkgrel=3
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
source=(https://github.com/sukria/Backup-Manager/archive/v0.7.10.tar.gz)
md5sums=('58e8e34dc939953b7c4b2482664eb009')

build() {
	cd "$srcdir/Backup-Manager-$pkgver"
	sed -e 's/=item B<--files-from=>file/=over 4\n\n&/' -i backup-manager-purge
	sed -e 's#/sbin#/bin#g' -i Makefile doc/user-guide.{txt,sgml}
}

package() {
	cd "$srcdir/Backup-Manager-$pkgver"
	make DESTDIR="$pkgdir" install || return 1
	mkdir -p "$pkgdir/etc"
	cp "$pkgdir/usr/share/backup-manager/backup-manager.conf.tpl" "$pkgdir/etc/backup-manager.conf"
}
