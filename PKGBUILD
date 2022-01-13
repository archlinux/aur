# Maintainer: icepie, icepie.dev@gmail.com

_pkgname=macast
_gitname=Macast
pkgname=${_pkgname}-git
pkgver=0.7
pkgrel=1
pkgdesc="DLNA Media Renderer"
arch=('any')
url="https://github.com/xfangfang/Macast"
license=('GPL3')
conflicts=('macast')
makedepends=('python-setuptools')
depends=(
	'python'
	'python-appdirs'
	'python-pillow'
	'python-pystray'
	'python-lxml'
	'python-requests'
	'python-pyperclip'
	'python-cherrypy'
	'python-netifaces'
	'mpv'
)
source=(
	"git+${url}.git#branch=main"
	"${_pkgname}.desktop"
)
sha256sums=(
	'SKIP'
	'3191dfa7386d63a24be335cf4d61c7c0229237160b94183f324d9e852617cfc5'
)

build() {
	cd "${_gitname}"
	python setup.py build
}

package() {
	cd "${_gitname}"
	install -d "${pkgdir}/usr/share/icons"
	cp "${_pkgname}/assets/icon.png" "${pkgdir}/usr/share/icons/Macast.png"
	install -d "${pkgdir}/usr/share/applications"
	# Installa desktop file
	mkdir -p "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
