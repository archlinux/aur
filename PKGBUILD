# Maintainer: Remy Adriaanse <remy@adriaanse.it>

_gemname=nokogiri
pkgname="ruby-${_gemname}"
pkgver=1.6.8
pkgrel=1
pkgdesc='HTML, XML, SAX, and Reader parser'
arch=('any')
url='http://nokogiri.org'
license=('MIT')
depends=('libxml2' 'libxslt' 'ruby' 'ruby-mini_portile2')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha512sums=('56a2a19e81f32bd39d8e2e85b4e2ed8a37e8963725fb5f41619c6f1760aea22af9c7c055b45fbd7f3221c707a4ef94791f8fbc9cdfea3ea603f4c783d74502d7')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
	rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
	rm -rf "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/ports"
	rm -rf "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/ext"
}
