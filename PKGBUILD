# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>

pkgname=oftoast-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Open Fortress installing and updating tool. Frontend for the Toast (TVN)."
arch=(x86_64)
url="https://openfortress.fun"
license=(GPL3)
provides=('oflauncher' 'ofjam' 'oftoast')
makedepends=("imagemagick")
optdepends=("steam")
source=('oftoast::https://toast.openfortress.fun/toast/oftoast-0.3.3-linux.bin'
		'https://raw.githubusercontent.com/int-72h/of-jam/main/ofjam/toast.png'
		'oftoast-bin.desktop')
sha256sums=('191fd81bab19a6d0f79d6317a746732cbfcdec29bceed86e575db9770c79ef0c'
			'f8a7d44428be53f6bc66b4948015651e3cdf12bea4e587e0e61fcd54112c137b'
			'f5c1cf0758431ecac6d011a270c27d306a14ffe7cd6cc71a010c3462f3be32a1')

package() {
	install -Dm0755 oftoast -t "${pkgdir}"/usr/bin

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	for _size in "512x512" "256x256" "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16"
	do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
		convert "${srcdir}/toast.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/toast.png"
	done
}
