# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname_='tilt'
pkgname="ruby-${_gemname_}-1"
pkgver='1.4.1'
pkgrel=1
pkgdesc='Generic interface to multiple Ruby template engines'
arch=('any')
url='https://github.com/rtomayko/tilt/'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem)
noextract=(${_gemname_}-${pkgver}.gem)
sha1sums=('a63b374ab06aeb6f567bd24e61434e386cce0811')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname_}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname_}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  rm -rf "${pkgdir}/usr/bin/"
}
