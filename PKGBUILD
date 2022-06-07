# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname='thin'
pkgname="ruby-${_gemname}-1.6"
pkgver=1.6.4
pkgrel=1
pkgdesc='Thin and fast Ruby web server, 1.6.x version'
arch=('i686' 'x86_64')
url="https://rubygems.org/gems/${_gemname}/versions/${pkgver}"
license=('RUBY')
depends=(
  'glibc'
  'ruby'
  'ruby-daemons>=1.0.9'       'ruby-daemons<2'
  'ruby-rack>=1.0'            'ruby-rack<2'
  'ruby-eventmachine>=1.0.4'  'ruby-eventmachine<2'
)
provides=("${pkgname%-*}=${pkgver}")
options=('!emptydirs')
source=("${_gemname}-${pkgver}.gem::https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
b2sums=('24db6f88d350755e3894b78bedb87e1af3e8dfb900ced0aad124eb0bc86725d5b566109c3e93142a511c3c8b891a5651fad613279dc7a849ac876a9dad300815')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}/${_gemdir}" \( -name 'mkmf.log' -or -name 'gem_make.out' \) -delete
}
