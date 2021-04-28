# Maintainer: setBoolean <setboolean@icloud.com>
pkgname="hornet-git"
_pkgname="hornet"
_branch="main"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="HORNET is a powerful IOTA fullnode software"
arch=('x86_64')
url="https://github.com/gohornet/hornet"
license=("Apache")
depends=()
makedepends=('go' 'git')
source=("git://github.com/gohornet/$_pkgname.git#branch=$_branch"
	"$_pkgname.service")
sha256sums=('SKIP'
            '06f5b5c6d3a7384610438f73ff82f6ba669c4d6274b70ffd0784b0011cc9b560')
backup=('etc/hornet/config.json' 'etc/hornet/config_as.json' 'etc/hornet/config_chrysalis_testnet.json' 'etc/hornet/peering.json' 'etc/hornet/profiles.json')
install=$_pkgname.install

build() {
	cd ${srcdir}/hornet

        # Build with rocksdb
	go build -tags=rocksdb

}
package() {

	# Install files
	install -Dm600 ${srcdir}/hornet/config.json ${pkgdir}/etc/hornet/config.json
	install -Dm600 ${srcdir}/hornet/config_as.json ${pkgdir}/etc/hornet/config_as.json
	install -Dm600 ${srcdir}/hornet/config_chrysalis_testnet.json ${pkgdir}/etc/hornet/config_chrysalis_testnet.json
	install -Dm600 ${srcdir}/hornet/peering.json ${pkgdir}/etc/hornet/peering.json
	install -Dm600 ${srcdir}/hornet/profiles.json ${pkgdir}/etc/hornet/profiles.json	
	install -D ${srcdir}/hornet/hornet ${pkgdir}/usr/bin/hornet	

	# Install systemd service
	install -D ${srcdir}/hornet.service ${pkgdir}/usr/lib/systemd/system/hornet.service
}
