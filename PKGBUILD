# Maintainer: matthias.brandt@elpro.com

pkgname=asyncapi-cli-bin
pkgver=2.16.10
pkgrel=1
pkgdesc="AsyncAPI CLI"
arch=('x86_64')
url="https://www.asyncapi.com/tools/cli"
license=('Apache-2.0')
depends=('nodejs')
source=("https://github.com/asyncapi/cli/releases/download/v${pkgver}/asyncapi.deb")
sha256sums=('d1dae47ca0667e3e16d7c7b34c1e22e4c352674a633fb728747b468bb1baaeec')

package() {
	tar xf data.tar*
	mkdir -p "${pkgdir}/opt/asyncapi-cli"
	chmod 777 -R "usr/lib/@asyncapi/cli/node_modules/generator-v2/node_modules/"
	cp -pR usr/lib/@asyncapi/cli/* "${pkgdir}/opt/asyncapi-cli" 
	mkdir -p "${pkgdir}/usr/bin"
	ln -s /opt/asyncapi-cli/bin/asyncapi "${pkgdir}/usr/bin/asyncapi-cli"
}

pre_remove() {
	# Installed generator files
	rm -rf "${pkgdir}/opt/asyncapi-cli/node_modules/generator-v2/node_modules"
}
