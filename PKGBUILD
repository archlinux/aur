# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=rqrcode_core
pkgname=ruby-${_gemname}
pkgver=1.1.0
pkgrel=1
pkgdesc='library for encoding QR Codes'
arch=('any')
url='https://github.com/whomwah/rqrcode_core'
license=("MIT")
depends=()
makedepends=("rubygems")
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
options=(!strip)
sha512sums=('1dc3f314a8b6eb65daac184900a7579e194aeb2a52776cad3884345b3649ac773173d5f647bac41bc4c7d75c72d010aee731e36b036465a05dbb90ac591ef9c0')

package() {
	local _gemdir="$(gem env gemdir)"
	gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem || return 1
	rm "$pkgdir/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/${_gemname}-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
