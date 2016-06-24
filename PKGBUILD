# Maintainer: Christopher Loen <christopherloen at gmail dot com>
_gemname_='libyajl2'
pkgname="ruby-${_gemname_}"
pkgver='1.2.0'
pkgrel=1
pkgdesc='Installs a vendored copy of libyajl2 for distributions which lack it'
arch=('any')
url='https://github.com/opscode/libyajl2-gem'
license=('Apache-2.0')
depends=('ruby')
options=(!emptydirs)
source=('https://rubygems.org/downloads/libyajl2-1.2.0.gem')
noextract=("${_gemname_}-${pkgver}.gem")
sha256sums=('1117cd1e48db013b626e36269bbf1cef210538ca6d2e62d3fa3db9ded005b258')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname_}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"          
}
