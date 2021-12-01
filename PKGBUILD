# Maintainer: Michael Asher < michael at we solve everything dot com> 

pkgname=crowdsec
pkgver=1.2.1
pkgrel=9
pkgdesc="The open-source and collaborative IPS"
arch=('any')
url="https://crowdsec.net"
license=('MIT')
install=crowdsec.install
source=(
	"$pkgname-source.tgz"::https://github.com/crowdsecurity/crowdsec/archive/refs/tags/v${pkgver}.tar.gz
	crowdsec.install
	Makefile.patch
)
depends=(
	'jq'
	'libnewt'
	'iptables'
	'ipset'
)
makedepends=(
	'jq'
	'libnewt'
	'go'
)
optdepends=(
	'docker: Used to run metabase container for statistics'
	'iptables-nft: For use with nftables'
)

provides=('crowdsec')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Patching makefile to include version
	# Perhaps this would be cleaner with sed
	#
	# patch Makefile < ${srcdir}/Makefile.patch
	make -s build
	make -s package
}

package() {
	mkdir -p ${pkgdir}/var/lib/crowdsec/installers/crowdsec
	cp -R ${srcdir}/${pkgname}-${pkgver}/crowdsec-/* ${pkgdir}/var/lib/crowdsec/installers/crowdsec
}
sha256sums=('e3a9bbb70b1995a83c5001d06dbbcb5f59d43e4d7c18b60548f305a62d2dd6a3'
            '6fd95ddc9e5bdb1abdfa1731e472f534789c5db6983dcdc5e1c41852592ce94c'
            '50235c78db3959e1ea97f12e1c8be13f75dfaeb0706b0a5c82fa856bb31f229d')
