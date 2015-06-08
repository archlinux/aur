# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Aliaksandr Stelmachonak <mail.avatar@gmail.com>


_appname_=zoiper
pkgname=${_appname_}-classic
pkgver=2.20
_filever_=220
pkgrel=1
pkgdesc="An IAX and SIP VoIP softphone"
arch=("i686" "x86_64")
url="http://www.zoiper.com/"
license=("custom")
depends=("gtk2" "alsa-lib" "libxdamage")
[ "$CARCH" = "x86_64" ] && depends=("lib32-gtk2" "lib32-alsa-lib" "lib32-libxdamage" "lib32-libsm" "lib32-pangox-compat" "lib32-libcanberra")
source=("LICENSE" "${pkgname}.desktop" "${pkgname}.png")

build() {
	cd "${srcdir}"

	# Tests
	if ! test -e ${startdir}/zoiper${_filever_}-linux.tar.gz; then
		# Messages
		warning "There is no longer a direct download link for the Zoiper tarball.  Get it manually from: http://www.zoiper.com/en/voip-softphone/download/zoiper-classic/for/linux"
		return 1
	fi

	# Extractions
	cp ${startdir}/zoiper${_filever_}-linux.tar.gz ./
	tar -zxf zoiper${_filever_}-linux.tar.gz
}

package() {
	cd "${srcdir}"

	# Directories
	install -d "${pkgdir}"/usr/bin "${pkgdir}"/usr/share/{applications,pixmaps} "${pkgdir}"/usr/share/licenses/${pkgname}

	# Files
	install -m755 ${_appname_} "${pkgdir}"/usr/bin/${pkgname}
	install -m644 ${pkgname}.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
	install -m644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
	install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

sha1sums=('74e9f2d5dc6ec7174923e824b3db64b47b6d3b3c'
          '0c97f32bf45d48ec992b1c1f22a7b24a904e4417'
          '1b68b4fc56baff2de6661b654053ce6b60fe174f')
