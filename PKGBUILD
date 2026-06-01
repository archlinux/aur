# Maintainer: sysitn <thegreatandrewsh@gmail.com>
# Contributor: kajoox <kayquesousa02004@gmail.com> (original maintainer)

pkgname=espressif-ide-bin
pkgver=4.2.0
pkgrel=1
pkgdesc='Eclipse-based IDE for ESP-IDF development'
arch=('x86_64')
url="https://github.com/espressif/idf-eclipse-plugin"
license=('EPL-2.0')
depends=('java-runtime>=21' 'python' 'python-pip' 'gtk3' 'dfu-util' 'webkit2gtk-4.1')
optdepends=('cmake: for building ESP-IDF projects'
            'ninja: for building ESP-IDF projects'
            'gcc: for compiling projects'
            'git: for version control and ESP-IDF installation')
options=('!strip')

source=(
	"${pkgname}-${pkgver}.tar.gz::https://dl.espressif.com/dl/idf-eclipse-plugin/ide/Espressif-IDE-${pkgver}-linux.gtk.x86_64.tar.gz"
	"espressif-ide.desktop"
)
sha256sums=('8dd49f6144fb758fe1a61757b0fc27221abe07bd55edb23baf1936f6cfc0204d'
            '01b498d77f4076a2b47bac488e47e1be164e5802cb39373256709f8441a33ad7')

package() {
	install -dm755 "${pkgdir}/opt/${pkgname}"
	cp -r "${srcdir}/Espressif-IDE/." "${pkgdir}/opt/${pkgname}/"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/espressif-ide" "${pkgdir}/usr/bin/espressif-ide"

	install -Dm644 "espressif-ide.desktop" "${pkgdir}/usr/share/applications/espressif-ide.desktop"
}
