# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Aliaksandr Stelmachonak <mail.avatar@gmail.com>

pkgname=zoiper
pkgver=5.2.10
pkgrel=2
pkgdesc="A SIP and IAX2 VoIP softphone"
url="http://www.zoiper.com/"
arch=("i686" "x86_64")
license=("custom")
depends=("gtk2" "gconf" "libnotify" "libxss" "v4l-utils")
source=("LICENSE" "${pkgname}.desktop" "${pkgname}.png" "${pkgname}-24.png" "${pkgname}-48.png" "${pkgname}-96.png")

build() {
	cd "${srcdir}"

	# Tests
	if ! test -e ${startdir}/${pkgname}5_${pkgver}_${CARCH}.tar.xz; then
		# Messages
		warning "There is no longer a direct download link for the Zoiper tarball.  Get it manually from: https://www.zoiper.com/en/voip-softphone/download/zoiper5/for/linux"
		return 1
	fi

	# Extractions
	cp ${startdir}/${pkgname}5_${pkgver}_${CARCH}.tar.xz ./
	tar -Jxf ${startdir}/${pkgname}5_${pkgver}_${CARCH}.tar.xz
}

package() {
	cd "${srcdir}"

	# Directories
	install -d "${pkgdir}"/usr/bin "${pkgdir}"/usr/share/{applications,pixmaps} "${pkgdir}"/usr/share/licenses/${pkgname} "${pkgdir}"/usr/lib/${pkgname}

	# Files
	cp -r Zoiper5/* "${pkgdir}"/usr/lib/${pkgname}/
	chmod 755 "${pkgdir}"/usr/lib/${pkgname}/${pkgname}
	install -m644 ${pkgname}.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
	install -m644 ${pkgname}-24.png "${pkgdir}"/usr/share/pixmaps/
	install -m644 ${pkgname}-48.png "${pkgdir}"/usr/share/pixmaps/
	install -m644 ${pkgname}-96.png "${pkgdir}"/usr/share/pixmaps/
	install -m644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
	install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
	ln -s /usr/lib/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/
}

sha1sums=('645d0003fe2e0975c53e008aa31106cceb0d8dad'
          'ec8e948442bd0d010004420f7338ccfb08985007'
          'c1eea005beb7587b24b0a0d242eebc49a67f9026'
          '1a0f4c83c6b538584865df327702f800689493b0'
          '7fef1f81c32fc4be2d876fadf34178f60ea0a29e'
          '11fb63a8353353d28288a644aeb4cdf9a3ab3e8c')
