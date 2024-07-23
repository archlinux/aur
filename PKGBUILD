# Maintainer: Pablo Hardouin <pablohardouin02 at gmail dot com>
_pkgname="MrPython"
pkgname="mrpython"
pkgver="5.1.3beta"
pkgrel=1
pkgdesc="A simplified programming environment for Python (3.x) - based on IDLE"
arch=("x86_64")
url="https://github.com/nohtyprm/MrPython"
license=('PSF')
groups=()
depends=('python' 'tk')
makedepends=()
provides=("$pkgname")
conflicts=("$pkgname")
source=("${pkgname}::https://github.com/nohtyprm/MrPython/archive/refs/tags/v${pkgver}.zip")
md5sums=('SKIP')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed -i 's/\.\/mrpython\/Application\.py/\/opt\/mrpython\/Application\.py/' mrpython.sh
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	# Licence
	install -Dm644 LICENSE.python "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.python"
	
	# Python sources
	mkdir -p "${pkgdir}/opt"
	cp -r mrpython/ "${pkgdir}/opt/mrpython/"
	chmod 755 "${pkgdir}/opt/mrpython"

	# Executable
	install -Dm755 mrpython.sh "${pkgdir}/usr/bin/mrpython"

	# Desktop entry
	mkdir -p "${pkgdir}/usr/share/applications/"
	echo "[Desktop Entry]
Type=Application
Name=MrPython
Exec=python /opt/mrpython/Application.py
Comment=MrPython
Categories=Development;IDE;
Terminal=false" >> "${pkgdir}/usr/share/applications/mrpython.desktop"
	chmod 666 "${pkgdir}/usr/share/applications/mrpython.desktop"
}
