# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=rqrcode
pkgname=ruby-${_gemname}
pkgver=1.1.2
pkgrel=1
pkgdesc='library for encoding QR Codes'
arch=('any')
url='https://github.com/whomwah/rqrcode'
license=("MIT")
depends=(
	'ruby-chunky_png>=1.0'
	'ruby-rqrcode_core>=0.1'
	)
makedepends=("rubygems")
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
options=(!strip)
sha512sums=('a1c7de526cf90cdd1dc6a00bd875d6f598128e2a079528553b09a911434357eb5a55508aca0cc49ebe3a69d409b758dd9a427587ea07827a3583b7fc7eb1ba4d')

package() {
	local _gemdir="$(gem env gemdir)"
	gem install --no-user-install --ignore-dependencies -i "${pkgdir}/${_gemdir}" ${_gemname}-${pkgver}.gem -n "${pkgdir}/usr/bin" || return 1
	rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
