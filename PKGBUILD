# Maintainer: setBoolean <setboolean@icloud.com>
pkgname="hornet-git"
_pkgname="hornet"
_branch="master"
pkgver="0.5.6"
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
            '56c5ecbdb4691465d0cdc3d5c95ea885c38281e1c721aa7153fd226755ea997b')
backup=('etc/hornet/config.json' 'etc/hornet/config_comnet.json' 'etc/hornet/config_devnet.json' 'etc/hornet/mqtt_config.json' 'etc/hornet/peering.json' 'etc/hornet/profiles.json')
install=$_pkgname.install

build() {
	cd ${srcdir}/hornet

        # Build with optimized PoWd
	go build -tags=pow_avx}

}
package() {

	# Install files
	install -Dm600 ${srcdir}/hornet/config.json ${pkgdir}/etc/hornet/config.json
	install -Dm600 ${srcdir}/hornet/config_comnet.json ${pkgdir}/etc/hornet/config_comnet.json
	install -Dm600 ${srcdir}/hornet/config_devnet.json ${pkgdir}/etc/hornet/config_devnet.json
	install -Dm600 ${srcdir}/hornet/mqtt_config.json ${pkgdir}/etc/hornet/mqtt_config.json
	install -Dm600 ${srcdir}/hornet/peering.json ${pkgdir}/etc/hornet/peering.json
	install -Dm600 ${srcdir}/hornet/profiles.json ${pkgdir}/etc/hornet/profiles.json	
	install -D ${srcdir}/hornet/hornet ${pkgdir}/usr/bin/hornet	

	# Install systemd service
	install -D ${srcdir}/hornet.service ${pkgdir}/usr/lib/systemd/system/hornet.service
}
