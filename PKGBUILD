# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=rqrcode
pkgname=ruby-${_gemname}
pkgver=2.0.0
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
sha512sums=('7dcb132e4aed126eb0abdc6c95d16a304887ad7484ee00b0444506c6af43a54bf6ad43d7753d32c23f0d64d74228c1e9d01c1f2865d7181ff72a1c2de7f2fbcf')

package() {
	local _gemdir="$(gem env gemdir)"
	gem install --no-user-install --ignore-dependencies -i "${pkgdir}/${_gemdir}" ${_gemname}-${pkgver}.gem -n "${pkgdir}/usr/bin" || return 1
	rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
