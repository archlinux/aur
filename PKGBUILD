# Maintainer: robertfoster
# Contributor: asm0dey <pavel.finkelshtein@gmail.com>

_gemname=jira-ruby
pkgname=ruby-${_gemname}
pkgver=2.2.0
pkgrel=1
pkgdesc='Ruby Gem for use with the Atlassian JIRA REST API'
arch=(any)
url='http://www.sumoheavy.com'
license=(MIT)
depends=('ruby' 'ruby-activesupport' 'ruby-atlassian-jwt' 'ruby-multipart-post' 'ruby-oauth')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('5b86f35283463ce613f940f67b0e9a246f292e18f4098fecb29bafd80c79f6b8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

