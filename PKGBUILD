# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname_='thin'
pkgname="ruby-${_gemname_}"
pkgver='1.7.0'
pkgrel=1
pkgdesc='A thin and fast web server'
arch=('any')
url='http://code.macournoyer.com/thin/'
license=('GPL2+' 'Ruby-1.8')
depends=('ruby' 'ruby-rack' 'ruby-eventmachine' 'ruby-daemons')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
noextract=("${_gemname_}-${pkgver}.gem")
sha256sums=('b8a49db7527ec1163ff06700b62d6e28c70ab4c822d8ba0821e479e9f1c109b7')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"

  rm -rf "${pkgdir}/${_gemdir}/gems/${_gemname_}-${pkgver}/ext"
}
