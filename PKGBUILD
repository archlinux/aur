# Maintainer: Sébastien Feugère <smonff@riseup.net>
# Contributor: Alex Kubica <alexkubicail@gmail.com>
pkgname=gopanda
pkgver=2
pkgrel=3
pkgdesc="Client for the Pandanet-IGS go Server" 
arch=('i686' 'x86_64')
url="http://pandanet-igs.com/communities/$pkgname$pkgversion"
license=('custom')
depends=('libnotify'
	 'alsa-lib'
	 'libxtst'
	 'gtk2'
	 'gconf'
	 'nss')
options=(!strip)
source=(LICENSE)
source_i686=("http://pandanet-igs.com/$pkgname$pkgver/installer/stable/linux-32/$pkgname$pkgver-linux-32.tar.gz")
source_x86_64=("http://pandanet-igs.com/$pkgname$pkgver/installer/stable/linux-64/$pkgname$pkgver-linux-64.tar.gz")
md5sums=('c5951d02adb28f6b333d913ae2f92df0')
md5sums_i686=('170e380003a712267e3e85c0fe38011a')
md5sums_x86_64=('d1fcd13d8de0f2c0331ee0a9cb58a58a')
_DEST="/usr/share/$pkgname"
_CLIENT="GoPanda2"
_DESKTOP="/usr/share/applications/${_CLIENT}.desktop"
_ICON="/usr/share/pixmaps/${_CLIENT}.png"

package() {
	# Copy license
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd "$srcdir/${_CLIENT}"

	# Program
	install -dm755 "${pkgdir}${_DEST}"
  	install -m755 "${_CLIENT}" "${pkgdir}${_DEST}"
    	install -m644 "nw.pak" "${pkgdir}${_DEST}"
	install -m644 "libffmpegsumo.so" "${pkgdir}${_DEST}"
        install -m644 "icudtl.dat" "${pkgdir}${_DEST}"
	
	# Link to program
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "${_DEST}/${_CLIENT}" "${pkgdir}/usr/bin/${pkgname}"

	# Icon
	install -Dm644 "${_CLIENT}.png" "${pkgdir}${_ICON}"

	# Desktop file
	install -Dm644 "${_CLIENT}.orig" "${pkgdir}${_DESKTOP}"
	echo "Exec=${_DEST}/${_CLIENT}" >> "${pkgdir}${_DESKTOP}"
	echo "Icon=${_ICON}" >> "${pkgdir}${_DESKTOP}"
	echo "MimeType=application/x-go-sgf;application/x-go-ugf;application/x-go-ugi;" >> "${pkgdir}${_DESKTOP}"
}
