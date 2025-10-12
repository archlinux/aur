# Maintainer: kajoox <kayquesousa02004@gmail.com>
pkgname=espressif-ide-bin
_name=espressif-ide
pkgver=3.6.0
pkgrel=2
pkgdesc='Eclipse-based IDE for ESP-IDF development'
arch=('x86_64')
url="https://github.com/espressif/idf-eclipse-plugin"
license=('EPL')
depends=('gcc' 'git' 'make' 'flex' 'bison' 'gperf' 'python' 'cmake' 'ninja' 'ccache' 'dfu-util' 'libusb' 'python-pip' 'gtk3' 'java-runtime>=17' 'maven')
source=("${_name}-${pkgver}.tar.gz::https://dl.espressif.com/dl/idf-eclipse-plugin/ide/Espressif-IDE-linux.gtk.x86_64/latest"
        "${_name}.desktop"
        "espressif-ide.png")
sha256sums=('71b1d278f4db1809a676b9dc57ecf2ad7aeeb161550992400400cd2559dc6b81'
            'db9e1eec551b3254d6b8da3b8d972cb76a9c405f7c7894f090f193ee700bcdfd'
            'f60870033123f7400a436fdc495a2bec3b50c96ffe2e4ad451296f1ae224e336')

package() {
	cd "$srcdir"
	install -dm755 "${pkgdir}/opt/${_name}"
	cp -r Espressif-IDE/* "${pkgdir}/opt/${_name}/"
	chmod +x "${pkgdir}/opt/${_name}/espressif-ide"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${_name}/espressif-ide" "${pkgdir}/usr/bin/${_name}"
	install -Dm644 "${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
	install -Dm644 "espressif-ide.png" "${pkgdir}/usr/share/pixmaps/${_name}.png"
	if [ -f "Espressif-IDE/icon.xpm" ]; then
		install -Dm644 "Espressif-IDE/icon.xpm" "${pkgdir}/usr/share/pixmaps/${_name}.xpm"
	fi
}
