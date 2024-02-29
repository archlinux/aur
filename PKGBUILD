# Maintainer: Jonas Bögle <aur@iwr.sh>

pkgname=yass-reloaded
pkgver=2024.2
pkgrel=2
pkgdesc="Editor for creating, fine-tuning, organizing and printing Ultrastar karaoke songs"
arch=('i686' 'x86_64')
url="https://github.com/DoubleDee73/Yass"
license=('GPL')
depends=('jdk-openjdk' 'java-openjfx' 'gtk2' 'bash')
makedepends=('unzip')
_filename="Yass-Reloaded-${pkgver}.jar"
source=(
	"https://github.com/DoubleDee73/Yass/releases/download/${pkgver}/${_filename}"
	"${pkgname}.desktop"
	"${pkgname}.sh")
sha256sums=('b004244c8d412566432ef21a9bf01fba3a15c9cc650ecb878f30ce0f015b7a59'
            '3302b96b565e374f6de96c7139407bf8ee7b4bc206405f7489ee2cb109a57382'
            '3e0621801eff30cd3ffd1dc9059099cc3cb63d8f932f72224ad19593ec8e7cfd')
options=(!strip)
noextract=("${_filename}")

package() {
	# jar
	install -Dm644 "${srcdir}/${_filename}" "${pkgdir}/usr/share/java/${pkgname}.jar"
	# icon
	unzip -j -d "${srcdir}" -o "${_filename}" yass/resources/icons/yass-icon.png
	install -Dm644 "${srcdir}/yass-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	# desktop
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	# launch script
	install -dm755 "${pkgdir}/usr/bin"
	install -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
