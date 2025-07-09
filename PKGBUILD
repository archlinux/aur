# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=basedpyright-bin
pkgver=1.30.0 # datasource=npm depName=basedpyright
pkgrel=1
pkgdesc='pyright fork with various type checking improvement and pylance features'
arch=("any")
url='https://github.com/DetachHead/basedpyright'
license=('MIT')
depends=("nodejs")
options=('!strip')
provides=('basedpyright')

source=("https://registry.npmjs.org/basedpyright/-/basedpyright-${pkgver}.tgz")
sha256sums=('25a02e9691de63be26a0b761de61a9dfdf5c82e240bdb3f4da9ea4d7f7b9c887')

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
