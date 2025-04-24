# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=basedpyright-bin
pkgver=1.29.1
pkgrel=1
pkgdesc='pyright fork with various type checking improvement and pylance features'
arch=("any")
url='https://github.com/DetachHead/basedpyright'
license=('MIT')
depends=("nodejs")
options=('!strip')
provides=('basedpyright')

source=("https://registry.npmjs.org/basedpyright/-/basedpyright-${pkgver}.tgz")
sha256sums=('97859fe21af1d8601fe5f1cbd7d68f0db156524e4b3bc8306730ab22533cec81')

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
