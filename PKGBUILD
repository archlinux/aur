# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=rqrcode_core
pkgname=ruby-${_gemname}
pkgver=1.2.0
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
sha512sums=('e2ada416dbd4e23a4dcd097ab993c3408131a043fffdac60783b356d93a6b93744943a4755ede64279e0f9fd615ee57cf14b237242da8f7fb0e7c999ca44449d')

package() {
	local _gemdir="$(gem env gemdir)"
	gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem || return 1
	rm "$pkgdir/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/${_gemname}-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
