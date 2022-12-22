# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=rqrcode
pkgname=ruby-${_gemname}
pkgver=2.1.2
pkgrel=1
pkgdesc='library for encoding QR Codes'
arch=('any')
url='https://github.com/whomwah/rqrcode'
license=("MIT")
depends=(
	'ruby-chunky_png>=1.0'
	'ruby-rqrcode_core>=1.0'
	)
makedepends=("rubygems")
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
options=(!strip)
sha512sums=('0a17d6cafe66ff5c6f3f62f36714ee11a5ac28ddf2262a722704f6b16e2dca9b3d1b0024cae0f64be82ea0aa769dca79bb84bb1e03fabe49412c530556a1ddbe')

package() {
	local _gemdir="$(gem env gemdir)"
	gem install --no-user-install --ignore-dependencies -i "${pkgdir}/${_gemdir}" ${_gemname}-${pkgver}.gem -n "${pkgdir}/usr/bin" || return 1
	rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
