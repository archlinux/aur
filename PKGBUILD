# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Hutts <archlinux@hutts.fastmail.com>
pkgname=etherdfs
pkgver=20180203
pkgrel=1
pkgdesc="An ethernet-based file system for DOS"
arch=('any')
url="http://etherdfs.sourceforge.net"
license=('MIT')
depends=('glibc')
source=("https://sourceforge.net/projects/etherdfs/files/ethersrv-linux/ethersrv-linux-$pkgver.tar.xz"
	 "etherdfs.service")
md5sums=('ec6a8ae58558a025c941f03da0f3fc55'
         'a35d04adc6ea3075ad04535b8494015b')

build() {
	cd "ethersrv-linux-$pkgver"
	make
}

package() {
	install -m644 -Dt "$pkgdir/usr/lib/systemd/system" etherdfs.service
	cd "ethersrv-linux-$pkgver"
	install -m644 -Dt "$pkgdir/usr/share/doc/$pkgname" ethersrv-linux.txt
	install -m644 -Dt "$pkgdir/usr/share/doc/$pkgname" history.txt
	install -m754 -Dt "$pkgdir/usr/bin" ethersrv-linux
	install -m664 -d "$pkgdir/srv/etherdfs"

}
