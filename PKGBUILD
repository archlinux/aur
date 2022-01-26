# Maintainer: Michael Asher < michael at we solve everything dot com> 
# Contributers: Stephen304

pkgname=crowdsec
pkgver=1.3.0
pkgrel=4
pkgdesc="The open-source and collaborative IPS"
arch=('any')
url="https://crowdsec.net"
license=('MIT')
install=crowdsec.install
source=(
	"$pkgname-v${pkgver}.tgz"::https://github.com/crowdsecurity/crowdsec/archive/refs/tags/v${pkgver}.tar.gz
	crowdsec.install
)
depends=(
	'jq'
	'libnewt'
)
makedepends=(
	'jq'
	'libnewt'
	'go'
)
optdepends=(
	'docker: Used to run metabase container for statistics'
)

provides=('crowdsec')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Adjust the Makefile to show the proper build version
	sed -Ei "s/(BUILD_VERSION\?=\")[^\"]+(\")/\1v${pkgver}\2/" Makefile	
	make -s build
	make -s package
}

package() {
	mkdir -p ${pkgdir}/usr/local/installers/crowdsec/crowdsec
	cp -R ${srcdir}/${pkgname}-${pkgver}/crowdsec-v${pkgver}/* ${pkgdir}/usr/local/installers/crowdsec/crowdsec
}

sha256sums=('b81419d9a1af500c16a02f052ac6af54253a621ee1575131dfae0f578426d816'
            '835770e449aba837c8d6362c3d946ecd6f47e41cdc21e0bda21497338f6132dc')
sha256sums=('b81419d9a1af500c16a02f052ac6af54253a621ee1575131dfae0f578426d816'
            'e94363de7cef3d3b8896e812a8a682fb672780069ffb3157447839a55b191e16')
