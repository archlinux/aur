pkgname=webdav-daemon
pkgver=v1.1.r17.93759c7
pkgver() {
	cd "WebDAV-Daemon"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}
pkgrel=1
pkgdesc="WebDAV server designed to be a replace for SMBA providing access to a system's files without taking ownership of them"
arch=(x86_64)
url="https://github.com/couling/WebDAV-Daemon"
license=('MIT')
depends=(libmicrohttpd libxml2 pam)
makedepends=('git')
backup=('etc/webdavd/conf.xml'
	'etc/logrotate.d/webdavd'
	'etc/pam.d/webdavd')
source=("git+https://github.com/couling/WebDAV-Daemon.git"
	conf.xml
	webdavd.logrotate
	webdavd.pam
	webdavd.service)

build() {
	cd "WebDAV-Daemon"
	make
}

package() {
	cd "WebDAV-Daemon"
	install -dm0755 "$pkgdir/usr/share/webdavd"

	install -Dm0644 package-with/conf.xml "$pkgdir/etc/webdavd/conf.xml.documented"
	install -m0644 package-with/share/* "$pkgdir/usr/share/webdavd/"

	install -Dm0644 "$srcdir"/webdavd.logrotate "$pkgdir/etc/logrotate.d/webdavd"
	install -Dm0644 "$srcdir"/webdavd.pam "$pkgdir/etc/pam.d/webdavd"
	install -Dm0644 "$srcdir"/webdavd.service "$pkgdir/usr/lib/systemd/system/webdavd.service"
	install -Dm0644 "$srcdir"/conf.xml "$pkgdir/etc/webdavd/conf.xml"

	install -Dm0755 build/rap "$pkgdir/usr/bin/rap"
	install -Dm0755 build/webdavd "$pkgdir/usr/bin/webdavd"
}
sha256sums=('SKIP'
            '1846a9e9804e5cd2c566280f3936fec36f5036b904001e06df73874b269317f3'
            '48bf81665fb3588e126bb8f121df46f8c4ad103e9a6010450ce33e838ab27e9e'
            '6cb1f277dbc77b9718ea4eac0e9f99c07a35d1012f6ae39a91516485e8f759d8'
            '93dbe69a295c1a5e3b6179ead5a925bcbfcc819b2f9ed80d68ab95981ce41723')
