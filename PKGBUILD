# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

_author=olrtg
pkgname=emmet-language-server
pkgver=2.6.1
pkgrel=2
pkgdesc="A language server for emmet.io"
arch=("any")
url="https://www.npmjs.com/package/@$_author/$pkgname"
license=('MIT')
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/@$_author/$pkgname/-/${pkgname}-${pkgver}.tgz")
sha256sums=('578b85af828393585f1ba46469e14a059be6b2f11b906233d0c0447fc1795a68')

build() {

	local cache_dir="$(mktemp -d)"

	cd "${srcdir}/package"
	npm i --cache ${cache_dir} --omit=dev --verbose

	rm -rf $cache_dir
}

package() {

	local dest="${pkgdir}/usr/lib/${pkgname}"

	mkdir -p $dest
	cp -r "${srcdir}/package/"* "${dest}"

	mkdir -p "${pkgdir}/usr/bin/"
	ln -sr "${dest}/dist/index.js" "${pkgdir}/usr/bin/${pkgname}"
	chmod 755 "${pkgdir}/usr/bin/${pkgname}"

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	mv "${dest}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	chmod 644 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
