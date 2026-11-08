# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=capella-bin
provides=(${pkgname%-bin})
pkgver=7.1.0.202606231255
pkgrel=1
pkgdesc='Model-Based Systems Engineering tool that implements the Arcadia method.'
arch=('x86_64' 'aarch64')
depends=(
	'alsa-lib'
	'bash'
	'java-runtime'
	'perl'
	'python'
	'libx11'
	'libxext'
	'libxi'
	'libxrender'
	'libxtst'
)
makedepends=('gendesk')
url="https://mbse-capella.org/"
license=('EPL-2.0')

# main tarball
_name_tgz="${pkgname%-bin}-${pkgver}-linux-gtk-${arch}.tar.gz"
source_x86_64=("https://mirror.umd.edu/eclipse/${pkgname%-bin}/core/products/releases/${pkgver:0:5}/${_name_tgz}")
source_aarch64=("${source_x86_64[@]}") # copy of the other one
sha512sums_x86_64=('4b0ffb38896bb793dfc7fab151d6b7d8901e50dfea484bd91351190a3c8c59e36854e23c81b7f4305c4848f0beb211aa78a6ff0f6c3c8c0af439329eb6af241a')
sha512sums_aarch64=('d4f449e6a0f8ff49a4fae1fa0217e17fd1afd12417633f100c021a03fb25979bc1369597240c00db6875fd052b8bdcc2b238d9be0770d1655a45773b0526f8e2')

# icon from GitHub
source=("${pkgname%-bin}.png::https://raw.githubusercontent.com/eclipse-capella/capella/refs/heads/master/releng/plugins/org.polarsys.capella.rcp/icons/Capella256x256.png")
sha512sums=('a8d33103d5adc0ffb76eb99692bfa055bafcfc292616cc4def3a3a7eeef4e04413b5d74c4df67471a1b0084c47d0068cf57bf9b6afa27bb86bac4f284fa71c9a')

prepare() {
	gendesk -f -n --pkgname "${pkgname%-bin}" --pkgdesc "${pkgdesc}"
}

package() {
	mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
	mv ${srcdir}/${pkgname%-bin} "${pkgdir}/opt"
	ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin"
	install -Dm644 "${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
	install -Dm644 "${pkgname%-bin}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
