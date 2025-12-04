# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=basedpyright-bin
pkgver=1.35.0 # datasource=npm depName=basedpyright
pkgrel=1
pkgdesc='pyright fork with various type checking improvement and pylance features'
arch=("any")
url='https://github.com/DetachHead/basedpyright'
license=('MIT')
depends=("nodejs")
options=('!strip')
provides=('basedpyright')

source=("https://registry.npmjs.org/basedpyright/-/basedpyright-${pkgver}.tgz")
sha256sums=('0c684aef8afbd86ee43a07bd8b00de12c48f7e576a60f1e87c4b2882dcce0050')

package() {

	local target="${pkgdir}/usr/lib/${pkgname/-bin/}"

	mkdir -p $target
	cd "${srcdir}/package/"
	cp -r "dist/" "index.js" "langserver.index.js" "$target"

	mkdir -p "${pkgdir}/usr/bin/"
	ln -sr "${target}/index.js" "${pkgdir}/usr/bin/basedpyright"
	ln -sr "${target}/langserver.index.js" "${pkgdir}/usr/bin/basedpyright-langserver"

	chown -R root:root "$pkgdir"
	chmod -R u=rwX,go=rX "$target"

	install -Dm644 "${srcdir}/package/LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
