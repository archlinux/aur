# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
_npmname=node-red
_npmver=1.0.6
pkgname=nodejs-${_npmname}
pkgver=${_npmver}
pkgrel=1
pkgdesc="A visual tool for wiring the Internet of Things."
arch=(x86_64 i686 armv5 armv6h armv7h aarch64)
url="https://nodered.org"
license=("APACHE")
depends=("nodejs")
makedepends=("npm")
optdepends=()
backup=("etc/default/nodejs-node-red")
install="${pkgname}.install"
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz"
		"nodejs-node-red.service"
		"nodejs-node-red.install"
		"nodejs-node-red.default")
noextract=("$_npmname-$_npmver.tgz")
sha256sums=("19be616f531976d121815ee56eebcb0ed2e51c72b0fb2a4384efe3ec65f1a537"
			"c342ea169bd9f57741d004c2864bfd78834c2063f30ea8ee1b2fa54a3ab93266"
			"9e8dc8552409ba03ba4e29b056a37074a7f12f0ca8507167075b2ce8e5daba04"
			"d08994475b06f270b2f1a2b3c99c22fd33f001dc2a10413460caded125f81f38")

package() {
  install -Dm644 nodejs-node-red.default "${pkgdir}/etc/default/nodejs-node-red"
  install -Dm644 nodejs-node-red.service "${pkgdir}/usr/lib/systemd/system/nodejs-node-red.service"
  mkdir -p ${pkgdir}/usr/lib/node_modules
  cd ${pkgdir}/usr/lib/node_modules
  npm install --global --user root --prefix ${pkgdir}/usr $_npmname@$_npmver
  mkdir -p "${pkgdir}/usr/share/nodejs-node-red"
}
