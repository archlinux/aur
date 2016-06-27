# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname_='compass-core'
pkgname="ruby-${_gemname_}"
pkgver='1.0.3'
pkgrel=2
pkgdesc='The Compass core stylesheet library'
arch=('any')
url='http://compass-style.org/reference/compass/'
license=('MIT')
depends=('ruby' 'ruby-sass' 'ruby-multi_json')
options=(!emptydirs)
source=(https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem)
noextract=("${_gemname_}-${pkgver}.gem")
sha512sums=('90ee9fbd2266fc3e437162c8920710e4885446333c8d4b5ae22c652c7572b93ce3071574fa74f432b0036795865f92c888a6d648ee20bf5618cf58fb7b2b1dd1')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname_}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname_}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}
