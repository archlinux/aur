# Maintainer: robertfoster
# Contributor: asm0dey <pavel.finkelshtein@gmail.com>

_gemname=jira-ruby
pkgname=ruby-${_gemname}
pkgver=2.1.5
pkgrel=1
pkgdesc='Ruby Gem for use with the Atlassian JIRA REST API'
arch=(any)
url='http://www.sumoheavy.com'
license=(MIT)
depends=('ruby' 'ruby-activesupport' 'ruby-atlassian-jwt' 'ruby-multipart-post' 'ruby-oauth')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('dbd4a641f9683fe7a2af5ac4d02c1a20cc221f5cffedcbb11d08f8d456c7080e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

