# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>

pkgname=oftoast-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Open Fortress installing and updating tool. Frontend for the Toast (TVN)."
arch=(x86_64)
url="https://openfortress.fun"
license=(GPL3)
provides=('oflauncher' 'oflauncher-rei' 'oftoast')
makedepends=("imagemagick")
optdepends=("steam")
source=('oftoast::https://toast-eu.openfortress.fun/toast/oftoast-0.3.1-linux.bin'
		'https://github.com/int-72h/oflauncher-rei/raw/main/ofrei/toast.png'
		'oftoast-bin.desktop')
sha256sums=('a2e85a6479515ec365df6f4d9e82f722033a145e966437cbe3c29a465ccdeb8b'
			'91a2daf9cb92bf552595e352536df8f58ac3a86f069fb48ccb605bc11f8eb7d8'
			'f5c1cf0758431ecac6d011a270c27d306a14ffe7cd6cc71a010c3462f3be32a1')

package() {
	install -Dm0755 oftoast -t "${pkgdir}"/usr/bin

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16"
	do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
		convert "${srcdir}/toast.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/toast.png"
	done
}
