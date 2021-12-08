# Maintainer: Ethan Djeric <ethan@ethandjeric.com>
pkgname=i3wins
pkgver=0.0.4
pkgrel=1
license=("MIT")
arch=('any')
pkgdesc="A better i3/sway window switcher with rofi"
url="https://github.com/ylmrx/i3wins"
makedepends=("python-setuptools")
depends=(
	"python"
	"python-i3ipc" 
	"python-dynmen" 
	"python-traitlets"
)
provides=("i3lasts")

source=(
	"https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
	"LICENSE" # LICENSE is included in git source, but not in PYPI source, so it is provided here.
)
optdepends=(
	"sway: compatible Wayland compositor"
	"i3-wm: compatible X11 window manager" 
	"i3-gaps: compatible X11 window manager"
	"rofi: comaptible X11 dynamic menu" 
	"rofi-lbonn-wayland: compatible Wayland dynamic menu"
)
sha256sums=('d3fb8d5342257f1d86401202da27d929458c9045af81c7d3afd072455f87c88e'
            'eb50b4519867346b2a79fbd7483a1924d4ed095ab382536a7827fb55c9975997')
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1

	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

