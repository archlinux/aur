# Maintainer: Patrick Schratz <patrick.schratz@gmail.com>
pkgname="electron6-bin"
_pkgname="electron6"
pkgver="6.1.3"
pkgrel="1"
pkgdesc="Build cross-platform desktop apps with JavaScript, HTML, and CSS"
arch=("x86_64")
url="https://electronjs.org/"
_github_url="https://github.com/electron/electron"
license=("MIT")
provides=("electron6")
conflicts=("electron6")
depends=("gtk3" "libxss" "nss")
source=("${_github_url}/releases/download/v${pkgver}/chromedriver-v${pkgver}-linux-x64.zip"
"${_github_url}/releases/download/v${pkgver}/electron-v${pkgver}-linux-x64.zip")
sha256sums=('e4e949f2b65752694b79a6fc4ed2c14be58e737da6776ab668c147e62ae62c4a'
            '3317457d7baf8b97dfec71cac3921d36450c315ac8176fb625ad0b57f2350493')
package() {
	cd "${srcdir}"
	mkdir -pm755 ${pkgdir}/usr/bin
	mkdir -pm755 ${pkgdir}/usr/lib/${pkgname}/{locales,resources}
	find . -maxdepth 1 -type f ! -name "*zip" -exec cp -t "${pkgdir}/usr/lib/${pkgname}/." {} +
	cp -R locales resources "${pkgdir}/usr/lib/${pkgname}/"
	cd "${pkgdir}/usr/bin"
	ln -nfs "../lib/${pkgname}/electron" "${_pkgname}"
}
