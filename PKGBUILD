# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Aliaksandr Stelmachonak <mail.avatar@gmail.com>

pkgname=zoiper
pkgver=3.3
pkgrel=1
pkgdesc="An IAX and SIP VoIP softphone"
arch=("i686" "x86_64")
url="http://www.zoiper.com/"
license=("custom")
depends=("gtk2" "alsa-lib" "libxdamage")
[ "$CARCH" = "x86_64" ] && _arch_="64" || _arch_="32"
[ "$CARCH" = "x86_64" ] && depends=("lib32-gtk2" "lib32-alsa-lib" "lib32-libxdamage" "lib32-libsm" "lib32-pangox-compat" "lib32-libcanberra")
source=("LICENSE" "${pkgname}.desktop" "${pkgname}.png" "${pkgname}-24.png" "${pkgname}-48.png" "${pkgname}-96.png")

build() {
	cd "${srcdir}"

	# Tests
	if ! test -e ${startdir}/Zoiper_${pkgver}_Linux_Free_32Bit_64Bit.tar.gz; then
		# Messages
		warning "There is no longer a direct download link for the Zoiper tarball.  Get it manually from: http://www.zoiper.com/en/voip-softphone/download/zoiper3/for/linux"
		return 1
	fi

	# Extractions
	cp ${startdir}/Zoiper_${pkgver}_Linux_Free_32Bit_64Bit.tar.gz ./
	tar -zxf ${startdir}/Zoiper_${pkgver}_Linux_Free_32Bit_64Bit.tar.gz
}

package() {
	cd "${srcdir}"

	# Directories
	install -d "${pkgdir}"/usr/bin "${pkgdir}"/usr/share/{applications,pixmaps} "${pkgdir}"/usr/share/licenses/${pkgname} "${pkgdir}"/usr/lib/${pkgname}

	# Scripts
	./Zoiper_${pkgver}_Linux_Free_${_arch_}Bit.run --mode unattended --prefix "${pkgdir}"/usr/lib/${pkgname} || true

	# Files
	chmod 755 "${pkgdir}"/usr/lib/${pkgname}/${pkgname}
	install -m644 ${pkgname}.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
	install -m644 ${pkgname}-24.png "${pkgdir}"/usr/share/pixmaps/
	install -m644 ${pkgname}-48.png "${pkgdir}"/usr/share/pixmaps/
	install -m644 ${pkgname}-96.png "${pkgdir}"/usr/share/pixmaps/
	install -m644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
	install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
	ln -sr "${pkgdir}"/usr/lib/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/
}

sha1sums=('74e9f2d5dc6ec7174923e824b3db64b47b6d3b3c'
          '2a9cfa52d01a65137d88241c7ca04976e4be0a5d'
          'c1eea005beb7587b24b0a0d242eebc49a67f9026'
          '1a0f4c83c6b538584865df327702f800689493b0'
          '7fef1f81c32fc4be2d876fadf34178f60ea0a29e'
          '11fb63a8353353d28288a644aeb4cdf9a3ab3e8c')
