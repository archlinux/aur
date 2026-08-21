# Maintainer: sysitn <thegreatandrewsh@gmail.com>
# Contributor: kajoox <kayquesousa02004@gmail.com> (original maintainer)

pkgname=espressif-ide-bin
pkgver=4.4.0
pkgrel=1
pkgdesc='Eclipse-based IDE for ESP-IDF development'
arch=('x86_64')
url="https://github.com/espressif/idf-eclipse-plugin"
license=('EPL-2.0')
depends=('java-runtime>=21' 'python' 'python-pip' 'gtk3' 'dfu-util' 'webkit2gtk-4.1')
optdepends=(
            'ninja: for building ESP-IDF projects'
            'gcc: for compiling projects'
            'git: for version control and ESP-IDF installation'
	    'cmake: for building projects and ESP-IDF installation'
	    'ccache: to speed up the assembly of ESP-IDF projects and ESP-IDF installation'
    )
options=('!strip')

source=(
	"${pkgname}-${pkgver}.tar.gz::https://dl.espressif.com/dl/idf-eclipse-plugin/ide/Espressif-IDE-${pkgver}-linux.gtk.x86_64.tar.gz"
	"espressif-ide.desktop"
)
sha256sums=('2fd36289c59abb9cb25afa24ce07a3c87138d983f76739f7e58c8ab5bacd0672'
            '01b498d77f4076a2b47bac488e47e1be164e5802cb39373256709f8441a33ad7')

package() {
	install -dm755 "${pkgdir}/opt/${pkgname}"
	cp -r "${srcdir}/Espressif-IDE/." "${pkgdir}/opt/${pkgname}/"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/espressif-ide" "${pkgdir}/usr/bin/espressif-ide"

	install -Dm644 "espressif-ide.desktop" "${pkgdir}/usr/share/applications/espressif-ide.desktop"
}
