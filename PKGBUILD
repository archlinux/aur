# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=rqrcode_core
pkgname=ruby-${_gemname}
pkgver=0.1.1
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
sha512sums=('b5d4bfc7f2f0f668282ce9b902c892d17dcfb9716d27d11ac4c54aa12c09b87de896c614b60aa302c518b6b72b452b078a97eeaabc52eee2e9f14d207df33733')

package() {
	local _gemdir="$(gem env gemdir)"
	gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem || return 1
	rm "$pkgdir/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/${_gemname}-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
