# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

_gemname=chunky_png
pkgname=ruby-${_gemname}
pkgver=1.4.0
pkgrel=1
pkgdesc='Read/write access to PNG images in pure Ruby'
arch=('any')
url='http://wiki.github.com/wvanbergen/chunky_png'
license=('MIT')
makedepends=('rubygems')
source=("http://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
options=(!strip)
sha512sums=('1276ba527723af973ca00535baab0dd3be8185cfaa77efb28c3b1ef1e949312710a616ca55711923875e54cb9c92b38de71062d2ba68b2314c7b9ce7a9b50b11')

package() {
	local _gemdir="$(gem env gemdir)"
	gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" ${_gemname}-${pkgver}.gem -n "${pkgdir}/usr/bin" || return 1
	rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
	install -Dm644 "${pkgdir}${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
