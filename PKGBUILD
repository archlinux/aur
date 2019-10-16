# Maintainer: Matthew McGinn <mamcgi@gmail.com>

pkgname="electron3-bin"
_pkgname="electron3"
pkgver="3.1.12"
pkgrel="1"
pkgdesc="Build cross-platform desktop apps with JavaScript, HTML, and CSS"
arch=("x86_64")
url="https://electronjs.org/"
_github_url="https://github.com/electron/electron"
license=("MIT")
provides=("electron3")
conflicts=("electron3")
depends=("gtk3" "libxss" "nss")
source=("${_github_url}/releases/download/v${pkgver}/chromedriver-v${pkgver}-linux-x64.zip"
"${_github_url}/releases/download/v${pkgver}/electron-v${pkgver}-linux-x64.zip")
sha256sums=('8256f20cb30d9f1c545c8228d7b59622743e270016e6541c51e3dbebb71ef790'
            'b3ad887ce96e4eba18c7736b4e504f71785d88e108a5f7ec0ac20afb9c106b88')

package() {
	cd "${srcdir}"
	mkdir -pm755 ${pkgdir}/usr/bin
	mkdir -pm755 ${pkgdir}/usr/lib/${pkgname}/{locales,resources}
	find . -maxdepth 1 -type f ! -name "*zip" -exec cp -t "${pkgdir}/usr/lib/${pkgname}/." {} +
	cp -R locales resources "${pkgdir}/usr/lib/${pkgname}/"
	cd "${pkgdir}/usr/bin"
	ln -nfs "../lib/${pkgname}/electron" "${_pkgname}"
}

# vim:set ts=2 sw=2 et:
