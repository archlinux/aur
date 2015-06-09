# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=yagv-git
_pkg=yagv
pkgrel=1
pkgver=r14.5bd15ed
pkgdesc="A fast 3D Gcode Viewer for Reprap-style 3D printers, in Python and OpenGL."
arch=('i686' 'x86_64')
url="https://github.com/jonathanwin/yagv"
license=('custom')
depends=('python2>=2.7.3' 'python2-pyglet>-1.1.4')
conflicts=('yagv')
provides=('yagv')
source=("${pkgname}"::"git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"

	# replace python by python2
	sed -i -e "s|#!/usr/bin/env python|#!/usr/bin/env python2|" yagv gcodeParser.py
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm644 "data/hana_swimsuit_fv_solid_v1.gcode" "${pkgdir}/usr/lib/${_pkg}/data/hana_swimsuit_fv_solid_v1.gcode"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkg}/data/README.md"
	install -Dm644 "gcodeParser.py" "${pkgdir}/usr/lib/${_pkg}/gcodeParser.py"
	install -Dm755 "yagv" "${pkgdir}/usr/lib/${_pkg}/yagv"

	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${_pkg}/yagv" "${pkgdir}/usr/bin"
}
