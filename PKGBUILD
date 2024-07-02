# Maintainer: laserK <echo 'Y29udGFjdEBrYXJzdGVucHVmYWhsLmRlCg==' | base64 -d>
pkgname=stm32cubemx
pkgver=6.12.0
pkgrel=1
epoch=
pkgdesc="graphical software configuration tool for STM32 microcontrollers that allows generating C initialization code"
arch=(any)
url="https://www.st.com/en/development-tools/stm32cubemx.html"
license=('custom')
groups=()
depends=('java-runtime>=17'
	'archlinux-java-run>=10'
	'bash')
makedepends=('imagemagick')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip !debug)
install=
changelog=
source=("https://sw-center.st.com/packs/resource/library/stm32cube_mx_v${pkgver//./}-lin.zip"
 	"stm32cubemx.desktop"
 	"stm32cubemx.sh")
noextract=()
sha512sums=('daf949742ec7bab3def3a6777165719d46eb0e94d9cfcb2ae02d7afb91ffccc4ce648eda5ef2ef06377f9e7fadc64ed2502a9b4de7f43edc411860de356fc428'
            '83c67bef3e8f8434903fe0c067442cc7473459386fdcb0225af1b3a75fd75e2be393f91f877c8410f1055ca4ec531b2df707fcab10663cae382a7f4066c8548b'
            'd0dfbf096d7d147f59ed9fc888e612636e6d025688f2ef82d528110da977e20175087eeb24bb398053ce0cb4e530dd0b4f0bd48574c028879ceffa44a04029c1')
validpgpkeys=()

package() {
   cd "${srcdir}"
	mkdir -p "${pkgdir}/opt/stm32cubemx"
	cp -r "${srcdir}/MX/." "${pkgdir}/opt/stm32cubemx"
	install -Dm 755 "${srcdir}/stm32cubemx.sh" "${pkgdir}/usr/bin/${pkgname}"
	#icon and desktop file
	magick "${srcdir}/MX/help/STM32CubeMX.ico[0]" "${srcdir}/MX/${pkgname}.png"
	install -Dm 644 "${srcdir}/MX/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	
	#license
	install -Dm 644 "${srcdir}/MX/help/software_license_agreement.pdf" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
