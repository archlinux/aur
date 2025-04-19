# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=basedpyright-bin
pkgver=1.29.0
pkgrel=1
pkgdesc='pyright fork with various type checking improvement and pylance features'
arch=("any")
url='https://github.com/DetachHead/basedpyright'
license=('MIT')
depends=("nodejs")
options=('!strip')
provides=('basedpyright')

source=("https://registry.npmjs.org/basedpyright/-/basedpyright-${pkgver}.tgz")
sha256sums=('b3636ddec4aeae195f76d96dde73aa315092315d8ba7259ef21bd5c7b753dcad')

package() {

	local target="${pkgdir}/usr/lib/${pkgname/-bin/}"

	mkdir -p $target
	cd "${srcdir}/package/"
	cp -r "dist/" "index.js" "langserver.index.js" "$target"

	mkdir -p "${pkgdir}/usr/bin/"
	ln -sr "${target}/index.js" "${pkgdir}/usr/bin/basedpyright"
	ln -sr "${target}/langserver.index.js" "${pkgdir}/usr/bin/basedpyright-langserver"

	install -Dm644 "${srcdir}/package/LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"

	chown -R root:root "$pkgdir"
	chmod -R u=rwX,go=rX "$target"
}
