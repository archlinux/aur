# Contributor: omgold@aur
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=ethon
pkgname=ruby-${_gemname}
pkgver=0.16.0
pkgrel=2
pkgdesc="Libcurl wrapper"
arch=('any')
url="https://github.com/typhoeus/ethon"
license=('MIT')
depends=('ruby' 'ruby-ffi')
makedepends=('ruby-rdoc')
options=(!emptydirs)
noextract=(${_gemname}-${pkgver}.gem)
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
sha256sums=('bba0da1cea8ac3e1f5cdd7cb1cb5fc78d7ac562c33736f18f0c3eb2b63053d9e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
