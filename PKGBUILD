# Maintainer: Matthew McGinn <mamcgi@gmail.com>

pkgname="electron3-bin"
_pkgname="electron3"
pkgver="3.1.13"
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
sha256sums=('aaaa85c1e3b83b0c9c4337e8a8fd46fcae7be3a00c7bb8ca5dc48169c88e34f8'
            '33ab34af83bd1063fb1581ad0fed6dc1120b6b5d1dba0a8db3164af3e95d55df')

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
