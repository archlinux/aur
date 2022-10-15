_npmname=whistle
_npmver=2.9.31
pkgname=nodejs-whistle # All lowercase
pkgver=2.9.31
pkgrel=1
pkgdesc="HTTP, HTTP2, HTTPS, Websocket debugging proxy"
arch=(any)
url="https://github.com/avwo/whistle"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(
	"https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz"
	"whistle.desktop"
	"nodejs-whistle.png"
)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('b881eae4eed1e28aef5fd6de2e4d7dcef964e2d5'
          'a8f84443d428494c3aa83702664fbdd63cb1a78d'
          '7e0711fb1e4ea12788824b6c4081ed0fb3d7f822')

package() {
	cd $srcdir
	install -Dm 644 whistle.desktop -t "${pkgdir}"/usr/share/applications/
	install -Dm 644 nodejs-whistle.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/nodejs-whistle.png
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
	chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
