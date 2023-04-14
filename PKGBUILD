# Maintainer: 	whitels <2959471117 at qq dot com>

_npmname=whistle
_npmver=2.9.45
_npmrel=1
pkgname=nodejs-whistle # All lowercase
pkgver=2.9.45
pkgrel=1
pkgdesc="HTTP, HTTP2, HTTPS, Websocket debugging proxy"
arch=(any)
url="https://github.com/avwo/whistle"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(
	"https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz"
	"whistle.desktop"
	"${pkgname}.png::https://raw.githubusercontent.com/avwo/whistle/master/biz/webui/htdocs/img/whistle.png"
)
noextract=(${_npmname}-${_npmver}.tgz)
sha1sums=('79f2825be38a653c902629649c2b89b369dbb31a'
          'ad7056273ff8d5c2798b4ab870f5981288a67c60'
          '74d44892ab7cac4c4b3f56b24158605ede05c984')

package() {
	cd $srcdir
	install -Dm 644 whistle.desktop -t "${pkgdir}"/usr/share/applications/
	install -Dm 644 nodejs-whistle.png "${pkgdir}"/usr/share/icons/hicolor/160x160/apps/nodejs-whistle.png
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
	chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
