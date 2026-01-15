# Maintainer: matthias.brandt@elpro.com

pkgname=asyncapi-cli-bin
pkgver=5.0.5
pkgrel=3
pkgdesc="AsyncAPI CLI"
arch=('x86_64')
url="https://www.asyncapi.com/tools/cli"
license=('Apache-2.0')
depends=('nodejs')
source=("https://github.com/asyncapi/cli/releases/download/v${pkgver}/asyncapi.deb")
sha256sums=('5e54628633c441354fcf7aabb26476565411c59e3555c4fc8ce35bfb24e9d7bd')
options=(!debug)

package() {
	tar xf data.tar*
	mkdir -p "${pkgdir}/opt/asyncapi-cli"
	chmod 777 -R "usr/lib/@asyncapi/cli/node_modules/generator-v2/node_modules/"
	cp -pR usr/lib/@asyncapi/cli/* "${pkgdir}/opt/asyncapi-cli" 

	# Create symlink
	mkdir -p "${pkgdir}/usr/bin"
	ln -s /opt/asyncapi-cli/bin/asyncapi "${pkgdir}/usr/bin/asyncapi-cli"

	# Create log dir
	mkdir -p "${pkgdir}/opt/asyncapi-cli/lib/utils/logs"
	chmod 777 -R "${pkgdir}/opt/asyncapi-cli/lib/utils/logs"
}

pre_remove() {
	# Installed generator files
	rm -rf "${pkgdir}/opt/asyncapi-cli/node_modules/generator-v2/node_modules"
}
