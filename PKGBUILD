# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname_='uglifier'
pkgname="ruby-${_gemname_}"
pkgver='3.0.0'
pkgrel=1
pkgdesc='Minifies JavaScript files by wrapping UglifyJS to be accessible in Ruby'
arch=('any')
url='http://github.com/lautis/uglifier'
license=('MIT')
depends=('ruby' 'ruby-execjs')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
noextract=("${_gemname_}-${pkgver}.gem")
sha256sums=('b00c78cf5b3f2d3c9727a1cba3ada40cac8b808e753a29465b3852fa3fee4715')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname_}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname_}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
