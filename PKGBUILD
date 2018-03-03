# Maintainer: Savino Jossi <savino.jossi@gmail.com>
# Maintainer: Harry Law <hasld@0x9.pw>

_pkgname=scientifica
pkgname=${_pkgname}-font
pkgver=1.0.3
pkgrel=1
pkgdesc='Tall and condensed bitmap font for geeks.'
license=('custom:SIL')
arch=(any)
url='https://github.com/NerdyPepper/scientifica'
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
conflicts=(scientifica-font)
provides=(scientifica-font)
install=${pkgname}.install
source=(https://raw.githubusercontent.com/NerdyPepper/${_pkgname}/master/regular/${_pkgname}-11.bdf
		https://raw.githubusercontent.com/NerdyPepper/${_pkgname}/master/bold/${_pkgname}Bold-11.bdf
		https://raw.githubusercontent.com/NerdyPepper/${_pkgname}/master/LICENSE)
md5sums=('cc934bd8cb8710f19986029d1dfba949'
		 '51307d6f31c7dcb1ffa7c081a5204b69'
		 '77b104b57cdfb5a0e62b76a0057009df')

build() {
	cat << EOF > "75-yes-${_pkgname}.conf"
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
<!-- Accept scientifica font -->
	<selectfont>
		<acceptfont>
			<pattern>
				<patelt name="family">
					<string>scientifica</string>
					<string>scientificaBold</string>
				</patelt>
			</pattern>
		</acceptfont>
	</selectfont>
</fontconfig>
EOF
}

package() {
	# Install actual font
	install -d "${pkgdir}/usr/share/fonts/misc"
	install -m644 "${srcdir}/${_pkgname}-11.bdf" "${pkgdir}/usr/share/fonts/misc/${_pkgname}-11.bdf"
	install -m644 "${srcdir}/${_pkgname}Bold-11.bdf" "${pkgdir}/usr/share/fonts/misc/"
	# Install font conf and link to conf.d
	install -d "${pkgdir}/etc/fonts/conf.avail"
	install -m644 "${srcdir}/75-yes-${_pkgname}.conf" "${pkgdir}/etc/fonts/conf.avail/"
	# Install license
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
