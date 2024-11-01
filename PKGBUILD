# Maintainer: icepie, icepie.dev@gmail.com

_pkgname=macast
_gitname=Macast
pkgname=${_pkgname}-git
pkgver=0.7.r31.gc867117
pkgrel=1
pkgdesc="DLNA Media Renderer"
arch=('any')
url="https://github.com/xfangfang/Macast"
license=('GPL3')
provides=('macast')
conflicts=('macast')
makedepends=('git' 'python-pip' 'python-setuptools')
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
	'python-urllib3'
	'mpv'
)
source=(
	"git+https://github.com/icepie/Macast.git#branch=main"
	"${_pkgname}.desktop"
)
sha256sums=('SKIP'
	'c63974af877e5d22a80d1d473dc155f403069d35a3793f6e2cb61f9be0a3d481')

pkgver() {
	cd "${_gitname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_gitname}"
	python setup.py build
}

package() {
	cd "${_gitname}"
	install -D "${_pkgname}/assets/icon.png" "${pkgdir}/usr/share/icons/macast.png"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}"
}
