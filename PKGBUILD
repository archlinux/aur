# Maintainer: matthias.brandt@elpro.com

pkgname=asyncapi-cli-bin
pkgver=6.0.1
pkgrel=1
pkgdesc="AsyncAPI CLI"
arch=('x86_64')
url="https://www.asyncapi.com/tools/cli"
license=('Apache-2.0')
depends=('nodejs')
source=("https://github.com/asyncapi/cli/releases/download/v${pkgver}/asyncapi.tar.gz")
sha256sums=('8b8cc730a2c9ba539755aa438bcee9a8a1c6e7ec6f076653698ef7f3fd81c2a5')
options=(!debug)

package() {
	mkdir -p "${pkgdir}/opt/asyncapi/cli"
	chmod 777 -R asyncapi/node_modules/@asyncapi/generator/node_modules/
	cp -pR asyncapi/* "${pkgdir}/opt/asyncapi/cli" 

	# Create symlink
	mkdir -p "${pkgdir}/usr/bin"
	ln -s /opt/asyncapi/cli/bin/asyncapi "${pkgdir}/usr/bin/asyncapi"

	# Create log dir
	mkdir -p "${pkgdir}/opt/asyncapi/cli/lib/utils/logs"
	chmod 777 -R "${pkgdir}/opt/asyncapi/cli/lib/utils/logs"
}

pre_remove() {
	# Installed generator files
	rm -rf "${pkgdir}/opt/asyncapi/cli/node_modules/generator-v2/node_modules"
}
